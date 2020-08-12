FROM ruby:2.6
RUN apt update && apt install -y nodejs
RUN mkdir /fastladder
ADD . /fastladder
WORKDIR /fastladder
RUN gem install bundler:1.16.2 && bundle -j9
ENV PORT=5000 RAILS_ENV=production
RUN ./bin/rake assets:precompile
EXPOSE 5000
CMD bundle exec unicorn -p $PORT -c ./config/unicorn.rb
