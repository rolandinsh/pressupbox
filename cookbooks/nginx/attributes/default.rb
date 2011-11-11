default[:nginx][:version]      = "0.8.54"
default[:nginx][:install_path] = "/opt/nginx-#{nginx[:version]}"
default[:nginx][:src_binary]   = "#{nginx[:install_path]}/sbin/nginx"
default[:nginx][:content_dir]  = "/var/www"
default[:nginx][:dest_port]    = nil

case platform
when "debian","ubuntu"
  default[:nginx][:dir]     = "/etc/nginx"
  default[:nginx][:log_dir] = "/var/log/nginx"
  default[:nginx][:user]    = "www-data"
  default[:nginx][:binary]  = "/usr/sbin/nginx"
else
  default[:nginx][:dir]     = "/etc/nginx"
  default[:nginx][:log_dir] = "/var/log/nginx"
  default[:nginx][:user]    = "www-data"
  default[:nginx][:binary]  = "/usr/sbin/nginx"
end

default[:nginx][:configure_flags] = [
  "--prefix=#{nginx[:install_path]}",
  "--conf-path=#{nginx[:dir]}/nginx.conf",
  "--with-http_ssl_module",
  "--with-http_gzip_static_module"
]

default[:nginx][:gzip] = "on"
default[:nginx][:gzip_http_version] = "1.0"
default[:nginx][:gzip_comp_level] = "2"
default[:nginx][:gzip_proxied] = "any"
default[:nginx][:gzip_types] = [
  "text/plain",
  "text/html",
  "text/css",
  "application/x-javascript",
  "text/xml",
  "application/xml",
  "application/xml+rss",
  "text/javascript"
]

default[:nginx][:keepalive]          = "on"
default[:nginx][:keepalive_timeout]  = 65
default[:nginx][:worker_processes]   = cpu[:total]
default[:nginx][:worker_connections] = 2048
default[:nginx][:server_names_hash_bucket_size] = 64
