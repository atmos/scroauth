scroauth
=========

Simplify shipping configuration via [github oauth]

Developing
==========
    % gem install bundler
    % bundle install
    % cp spec/config.rb.example spec/config.rb
    ... modify variables so you can really test it yourself
    % bundle exec rake

Using the Library
=================
    require 'scro/auth'

    include Scro::Auth

    user  = User.new('atmos', '76c2f7a2181236921fcc2185109661f9d69ad894')
    repos = user.watched_repos

[github oauth]: http://gist.github.com/419219
