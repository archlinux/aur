#!/bin/bash

build(){
  add_systemd_unit "${SRCDIR}/kata-containers.target"
  add_systemd_unit "${SRCDIR}/kata-agent.service"
  add_binary "${SRCDIR}/kata-agent"
}
