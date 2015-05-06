yum_repository "nginx" do
  description "nginx"
  baseurl "http://nginx.org/packages/centos/$releasever/$basearch/"
  gpgcheck false
  action :create
end
package "nginx"
