FROM ruby:2.5

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

RUN chown 1000650000:1000650000 /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN chmod +x s3.rb start.sh

CMD ["./start.sh"]
