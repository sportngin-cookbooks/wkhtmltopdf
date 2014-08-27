# This should be pulled from the distro
if node['kernel']['machine'] == 'x86_64'
	default['wkhtmltox']['arch'] = 'amd64'
else
	default['wkhtmltox']['arch'] = 'i386'
end

# chef-sugar would be nice for this?

case node[:platform]
when "centos"
  if node[:platform_version].start_with?('6.')
    default['wkhtmltox']['release'] = "centos6"
  end
  if node[:platform_version].start_with?('5.')
    default['wkhtmltox']['release'] = "centos5"
    default['wkhtmltox']['options'] = "--nogpgcheck"
  end
end

default['wkhtmltox']['version'] = "0.12.1"

if node['wkhtmltox']['version'] && node['wkhtmltox']['release'] && node['wkhtmltox']['arch']
  default['wkhtmltox']['package_file'] = "wkhtmltox-#{node['wkhtmltox']['version']}_linux-#{node['wkhtmltox']['release']}-#{node['wkhtmltox']['arch']}.rpm"
end
