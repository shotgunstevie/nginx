yum_packages = [
  "pcre",
  "gc",
  "pcre-devel",
  "git",
  "gcc",
  "gcc-c++",
  "zlib-devel",
  "make",
  "wget",
  "openssl-devel",
  "libxml2-devel",
  "libxslt-devel",
  "gd-devel",
  "perl-ExtUtils-Embed",
  "GeoIP-devel",
  #"gperftools",
  #"gperftools-devel",
  "libatomic_ops-devel",
]
yum_packages.each do |pkg|
  package pkg
end
directory node["nginx"]["src_dir"] do
  action :create
  user node["nginx"]["deploy_user"]
  group node["nginx"]["deploy_group"]
  mode "755"
  recursive true
end
git node["nginx"]["src_dir"] do
  repository "https://github.com/nginx/nginx.git"
  revision "nginx-#{node["nginx"]["version"]}"
  action :sync
  user node["nginx"]["deploy_user"]
  group node["nginx"]["deploy_group"]
end
template "/tmp/compile_nginx.sh" do
  source "compile_nginx.sh.erb"
end
execute "bash /tmp/compile_nginx.sh"
