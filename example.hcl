# This example config is neither production-ready
# nor secure. Please consult the official docs
# for full configuration instructions:
# https://www.nomadproject.io/docs/agent/config.html

bind_addr = "0.0.0.0"

leave_on_interrupt = true
leave_on_terminate = true

server {
  enabled = true
  bootstrap_expect = 1
}

client {
  enabled = true
}
