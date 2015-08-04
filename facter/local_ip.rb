require 'facter'
require 'socket'

def my_first_private_ipv4
  addrobj = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
  if !addrobj.nil?
    addrobj.ip_address
  else
    ''
  end
end

def my_first_public_ipv4
  addrobj = Socket.ip_address_list.detect{|intf| intf.ipv4? and !intf.ipv4_loopback? and !intf.ipv4_multicast? and !intf.ipv4_private?}
  if !addrobj.nil?
    addrobj.ip_address
  else
    ''
  end
end

Facter.add(:lan_ip) do
  setcode do
    my_first_private_ipv4
  end
end

Facter.add(:ext_ip) do
  setcode do
    my_first_public_ipv4
  end
end
