scroauth
=========

I got that GitHub Oauth token, requestin' shit on behalf-a some scros.

Developing
==========
    % gem install bundler
    % bundle install
    % bundle exec rake

Hax
===
    require 'scro/auth'
    include Scro::Auth

    user  = User.new('atmos', '76c2f7a2181236921fcc2185109661f9d69ad894')
    repos = user.watched_repos

