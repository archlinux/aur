listen = "127.0.0.1:53"

upstream "all" {
  type = "udp"
  addr = "8.8.8.8:53"
}

rules = {
  default: "all"
}
