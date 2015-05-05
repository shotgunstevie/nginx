default["nginx"]["version"] = "1.8"
default["nginx"]["src_dir"] = "/src/nginx/"
default["nginx"]["pcre_version"] = "pcre2-10.00"
default["nginx"]["pcre_dir"] = default["nginx"]["src_dir"]+default["nginx"]["pcre_version"]
default["nginx"]["deploy_user"] = "root"
default["nginx"]["deploy_group"] = "root"
default["nginx"]["worker_user"] = "root"
default["nginx"]["worker_group"] = "root"
default["nginx"]["compile_options"] = {
  # Files and permissions
  "--prefix" => "/usr/local/",
  "--sbin-path" => "/usr/local/sbin/nginx",
  "--conf-path" => "/usr/local/conf/nginx.conf",
  "--pid-path" => "/usr/local/logs/nginx.pid",
  "--error-log-path" => "/usr/local/logs/error.log",
  "--http-log-path" => "/usr/local/logs/access.log",
  "--user" => "#{default["nginx"]["worker_user"]}",
  "--group" => "#{default["nginx"]["worker_group"]}",

  # Event loop
  "--with-select_module" => "--with-select_module",
  # "--with-select_module" => "--without-select_module",
  "--with-poll_module" => "--with-poll_module",
  #"--with-poll_module" => "--without-poll_module",

  # Optional Modules,
  "--without-http_gzip_module" => "--without-http_gzip_module",
  "--without-http_rewrite_module" => "--without-http_rewrite_module",
  "--without-http_proxy_module" => "--without-http_proxy_module",
  #"--with-http_ssl_module" => "with-http_ssl_module",
  "--with-pcre" => "#{default["nginx"]["pcre_dir"]}",
  #"--with-pcre-jit" => "--with-pcre-jit",
  #"--with-zlib" => "/src/zlib",
  #"--with-cc-opts" => [
  #  "-L /usr/local/lib",
  #],
  #"--with-ld-opts" => [
  #  "-I /usr/local/include",
  #]
}
