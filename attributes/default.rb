# This should be pulled from the distro
if node['kernel']['machine'] == 'x86_64'
	default['wkhtmltox']['arch'] = 'amd64'
else
	default['wkhtmltox']['arch'] = 'i386'
end

default['wkhtmltox']['version'] = "0.12.1"
default['wkhtmltox']['distro'] = "centos6"
