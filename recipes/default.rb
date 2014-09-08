package_file = node['wkhtmltox']['package_file']
log "package_file: #{package_file}"
raise "No package_file (This platform/version is not supported)" unless package_file

cache_dir    = Chef::Config[:file_cache_path]
package_path = File.join(cache_dir, package_file)

cookbook_file package_path do
  source package_file
end

package "wkhtmltox" do
  action :install
  source package_path
  options node['wkhtmltox']['options']

  # Will a version check work as a not_if would?
  #version node['wkhtmltox']['version']
end
