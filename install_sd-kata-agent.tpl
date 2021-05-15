#!/bin/bash

build(){
  add_systemd_unit "${SRCDIR}/kata-containers.target"
  add_systemd_unit "${SRCDIR}/kata-agent.service"
  add_binary "${SRCDIR}/target/${KARCH}-unknown-linux-gnu/release/kata-agent"
}
