FROM ruby:2.7.0

# throw errors if Gemfile has been modified since Gemfile.lock
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client npm \
&& rm -rf /var/lib/apt/lists/* \
&& npm install --global yarn

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# コンテナー起動時に毎回実行されるスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# イメージ実行時に起動させる主プロセスを設定
CMD ["rails", "server", "-b", "0.0.0.0"]
