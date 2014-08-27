cache_dir    = Chef::Config[:file_cache_path]
package_file = node['wkhtmltox']['package_file']
package_path = File.join(cache_dir, package_file)


# Will the package manager handle this?
#packages = value_for_platform_family(
  # Debian package haven't been tested since change to "toX"
  # ['debian'] => %w(libxrender1 libxext6 libfontconfig1 libpng libjpeg),
#  ['fedora','rhel'] => %w(openssl libXrender libXext fontconfig-devel urw-fonts libpng libjpeg zlib libstdc++)
#)

#packages.each do |pkg|
#  package pkg
#end

cookbook_file package_path do
  source package_file
end

package "wkhtmltox" do
  action :install
  source package_path

  # Will a version check work as a not_if would?
  #version node['wkhtmltox']['version']
end
