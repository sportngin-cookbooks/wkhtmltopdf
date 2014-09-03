# This should be pulled from the distro
if node['kernel']['machine'] == 'x86_64'
	default['wkhtmltox']['arch'] = 'amd64'
else
	default['wkhtmltox']['arch'] = 'i386'
end

if platform_family?('rhel')
  if node[:platform_version].start_with?('5.')
    default['wkhtmltox']['release'] = "centos5"
    default['wkhtmltox']['options'] = "--nogpgcheck"
  else
    default['wkhtmltox']['release'] = "centos6"
  end
end

default['wkhtmltox']['version'] = "0.12.1"

wk = node['wkhtmltox']
if wk['version'] && wk['release'] && wk['arch']
  default['wkhtmltox']['package_file'] = "wkhtmltox-#{wk['version']}_linux-#{wk['release']}-#{wk['arch']}.rpm"
end
