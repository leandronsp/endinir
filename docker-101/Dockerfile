FROM ruby:2.7 as dev
WORKDIR /docker-101

FROM dev as production
ADD . .
CMD ["ruby", "test_ruby.rb"]
