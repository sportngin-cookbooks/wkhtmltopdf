# This should be pulled from the distro
if node['kernel']['machine'] == 'x86_64'
	default['wkhtmltox']['arch'] = 'amd64'
else
	default['wkhtmltox']['arch'] = 'i386'
end

default['wkhtmltox']['distro'] = "centos6"

default['wkhtmltox']['version'] = "0.12.1"

default['wkhtmltox']['package_file'] = "wkhtmltox-#{node['wkhtmltox']['version']}_linux-#{node['wkhtmltox']['distro']}-#{node['wkhtmltox']['arch']}.rpm"
