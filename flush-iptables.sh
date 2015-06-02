#!/bin/bash

IPTABLES='/usr/bin/iptables'

for table in $(cat /proc/net/ip_tables_names) ; do
  $IPTABLES -t $table -F &>/dev/null && \
    $IPTABLES -t $table -X &>/dev/null && \
    $IPTABLES -t $table -Z &>/dev/null
done

# reset policies
for table in filter nat mangle raw ; do
  if grep -qw $table /proc/net/ip_tables_names ; then
    $IPTABLES -t $table -P OUTPUT ACCEPT
  fi
done
for table in filter mangle ; do
  if grep -qw $table /proc/net/ip_tables_names ; then
    $IPTABLES -t $table -P INPUT ACCEPT
    $IPTABLES -t $table -P FORWARD ACCEPT
  fi
done
for table in nat mangle raw ; do
  if grep -qw $table /proc/net/ip_tables_names ; then
    $IPTABLES -t $table -P PREROUTING ACCEPT
  fi
done
for table in nat mangle ; do
  if grep -qw $table /proc/net/ip_tables_names ; then
    $IPTABLES -t $table -P POSTROUTING ACCEPT
  fi
done
