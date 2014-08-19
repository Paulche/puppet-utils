
require 'ipaddr'

module Puppet::Parser::Functions
  newfunction(:netmask, :type => :rvalue) do |args|
    cidr    = args[0]

    IPAddr.new('255.255.255.255').mask(cidr).to_s
  end
end
