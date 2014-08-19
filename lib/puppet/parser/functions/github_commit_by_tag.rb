
require 'githubapi'

module Puppet::Parser::Functions
  newfunction(:github_commit_by_tag, :type  => :rvalue) do |args|
    GithubApi.request args[0], 'tags', args[1], args[2]
  end
end

