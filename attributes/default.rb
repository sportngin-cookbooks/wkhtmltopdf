if node['kernel']['machine'] == 'x86_64'
	default['wkhtmltopdf']['arch'] = 'amd64'
else
	default['wkhtmltopdf']['arch'] = 'i386'
end

default['wkhtmltopdf']['install_dir'] = "/usr/local/bin"
default['wkhtmltopdf']['version'] = '0.10.0_rc2'

default['wkhtmltopdf']['binary_extracted_name'] = "wkhtmltopdf-#{node['wkhtmltopdf']['version']}-#{node['wkhtmltopdf']['arch']}"
