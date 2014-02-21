# Much of this recipe is copied from https://github.com/bflad/chef-wkhtmltopdf

cache_dir = Chef::Config[:file_cache_path]
tgz_path = File.join(cache_dir, "#{node['wkhtmltopdf']['binary_extracted_name']}.tgz")
version = node['wkhtmltopdf']['version']

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
  not_if do
    File.exists?(File.join(cache_dir, node['wkhtmltopdf']['binary_extracted_name'])) &&
    `#{node['wkhtmltopdf']['install_dir']}/wkhtmltopdf -- version`.include?(version.sub(/[^0-9\.].*/, ''))
  end
end

new_bin_file   = "#{node['wkhtmltopdf']['install_dir']}/wkhtmltopdf"
extracted_file = "#{node['wkhtmltopdf']['binary_extracted_name']}"

execute "cp #{extracted_file} #{new_bin_file}" do
  cwd cache_dir
  not_if do
    File.exists?(new_bin_file) &&
    `#{new_bin_file} -- version`.include?(version.sub(/[^0-9\.].*/, ''))
  end
end
