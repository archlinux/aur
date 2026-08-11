return {
  version = 1,
  max_connections = null,
  management = nil,
  stats = {
    binds = { "127.0.0.1:8404" },
    -- /metrics and /ready are public; set a secure token file to enable other stats routes.
    admin_token_file = nil,
  },
  certificates = {},
  tls_profiles = {},
  listeners = {},
  cache_stores = {},
  upstream_pools = {},
  http_services = {},
  forward_proxy_services = {},
  rtmp_services = {},
  l4_services = {},
}
