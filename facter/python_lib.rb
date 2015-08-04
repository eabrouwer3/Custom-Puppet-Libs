# python_lib.rb

require 'facter'

Facter.add(:python_lib) do
    setcode 'python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"' 
end
