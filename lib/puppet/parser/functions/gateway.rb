
require 'ipaddr'

module Puppet::Parser::Functions
  newfunction(:gateway, :type => :rvalue) do |args|
    ip    = args[0]
    cidr  = args[1]

    IPAddr.new("#{ip}/#{cidr}").to_range.each_slice(2).first.last.to_s
  end
end
