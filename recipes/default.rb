# Much of this recipe is copied from https://github.com/bflad/chef-wkhtmltopdf

cache_dir = Chef::Config[:file_cache_path]
tgz_path = File.join(cache_dir, "#{node['wkhtmltopdf']['binary_extracted_name']}.tgz")

packages = value_for_platform_family(
  ['debian'] => %w(libxrender1 libxext6 libfontconfig1),
  ['fedora','rhel'] => %w(libXrender libXext urw-fonts openssl-devel fontconfig-devel)
)

packages.each do |pkg|
  package pkg
end

cookbook_file tgz_path do
  source "#{node['wkhtmltopdf']['binary_extracted_name']}.tgz"
  mode '0644'
end

execute "Extract #{tgz_path}" do
  cwd cache_dir
  command "tar zxf #{tgz_path}"
  creates File.join(cache_dir, node['wkhtmltopdf']['binary_extracted_name'])
end

execute "Copy wkhtmltopdf to #{node['wkhtmltopdf']['install_dir']}" do
  cwd cache_dir
  command <<-COMMAND
    cp #{node['wkhtmltopdf']['binary_extracted_name']} #{node['wkhtmltopdf']['install_dir']}/wkhtmltopdf
  COMMAND
  creates "#{node['wkhtmltopdf']['install_dir']}/wkhtmltopdf"
end
