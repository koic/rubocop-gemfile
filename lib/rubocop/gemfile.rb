require "rubocop"
require "rubocop/gemfile/version"
require "rubocop/gemfile/inject"

RuboCop::Gemfile::Inject.defaults!

# cops
require "rubocop/cop/gemfile/single_group"
