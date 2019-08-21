FROM ruby:2.6.3-alpine

RUN mkdir -p /usr/src/bot
WORKDIR /usr/src/bot

COPY . /usr/src/bot
RUN bundle install

CMD ["bundle", "exec", "ruby", "bot.rb"]