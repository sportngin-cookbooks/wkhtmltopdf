package_file   = node['wkhtmltox']['package']

if package_file.empty?
  wk_version     = node['wkhtmltox']['version']
  wk_arch        = node['wkhtmltox']['arch']
  wk_distro      = node['wkhtmltox']['distro']
  package_file   = "wkhtmltox-#{wk_version}_linux-#{wk_distro}-#{wk_arch}.rpm"
end

log "package_file: #{package_file}"
log "platform_version: #{node['platform_version']}"

# Will the package manager handle this?
#packages = value_for_platform_family(
  # Debian package haven't been tested since change to "toX"
  # ['debian'] => %w(libxrender1 libxext6 libfontconfig1 libpng libjpeg),
#  ['fedora','rhel'] => %w(openssl libXrender libXext fontconfig-devel urw-fonts libpng libjpeg zlib libstdc++)
#)

#packages.each do |pkg|
#  package pkg
#end

cookbook_file package_file do
  source package_file
end

package "wkhtmltox" do
  action :install
  source package_file

  # Will a version check work as a not_if would?
  #version node['wkhtmltox']['version']
end
