
require 'puppet'

Facter.add('under_vagrant') do
  setcode do
    if Puppet::Type.type(:user).provider(:useradd).instances.detect { |el| el.name == 'vagrant' }
      'true'
    else
      'false'
    end
  end
end

