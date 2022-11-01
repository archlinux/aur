server = true
bootstrap_expect = 3
data_dir = "/var/lib/consul"
bind_addr = "127.0.0.1"
datacenter = "dc1"
performance {
  raft_multiplier = 1
}
ui_config {
  enabled = true
}
