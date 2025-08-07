#!/bin/bash

api_url="https://ipsaya.id"
ip_version=""

print_help() {
  echo "Usage: $0 [OPTIONS]"
  echo
  echo "Optional flags:"
  echo "  -4           Use IPv4"
  echo "  -6           Use IPv6"
  echo "  -h, --help   Show this help message"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -4)
      ip_version="4"
      shift
      ;;
    -6)
      ip_version="6"
      shift
      ;;
    -f|--full)
      ip_version="6"
      shift
      ;;
    -h|--help)
      print_help
      exit 0
      ;;
    -*)
      echo "Unknown option: $1"
      echo
      print_help
      exit 1
      ;;
    *)
      break
      ;;
  esac
done

if [[ "$ip_version" == "4" ]]; then
  curl -4 "$api_url"
elif [[ "$ip_version" == "6" ]]; then
  curl -6 "$api_url"
else
  curl "$api_url"
fi
