
require 'githubapi'

module Puppet::Parser::Functions
  newfunction(:github_commit_by_head, :type => :rvalue) do |args|
    GithubApi.request args[0], 'heads', args[1], args[2]
  end
end
