# I wish this worked... (it only works for symbol keys)
# rpm_name       = "wkhtmltox-%{version}_linux-%{distro}-%{arch}.rpm" % node['wkhtmltox']

wk_version     = node['wkhtmltox']['version']
wk_arch        = node['wkhtmltox']['arch']
wk_distro      = node['wkhtmltox']['distro']
rpm_name       = "wkhtmltox-#{wk_version}_linux-#{wk_distro}-#{wk_arch}.rpm"

cache_dir      = Chef::Config[:file_cache_path]
rpm_path       = File.join(cache_dir, rpm_name)

packages = value_for_platform_family(
  # Debian package haven't been tested since change to "toX"
  # ['debian'] => %w(libxrender1 libxext6 libfontconfig1 libpng libjpeg),
  ['fedora','rhel'] => %w(openssl libXrender libXext fontconfig-devel urw-fonts libpng libjpeg zlib libstdc++)
)

packages.each do |pkg|
  package pkg
end

cookbook_file rpm_path do
  source rpm_path
  # Is this needed?
  mode '0644'
end

yum_package "wkhtmltox" do
  action :install
  # Is this needed with cookbook_file?
  # source rpm_path

  # Will a version check work as a not_if would?
  #version wk_version
end
