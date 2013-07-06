#!/bin/bash

__NAME__=pdf-decrypt

function pdf-decrypt() {
  function pdf-decrypt-error-handler() {
  local errno=$1
  if [ $errno -gt 0 ]; then
      echo "The program 'qpdf' exited with code $errno!" > /dev/stderr
      echo "Press Enter to exit." > /dev/stderr
      read
      exit $errno
  fi
  }
  case $1 in -h|--help|''):
    echo Usage: \"$0 [file]\".
    echo Removes passwort-protection from PDF-File called [file].
    exit 0
    ;;
  esac
  if [ -f "$1" ]; then 
      local file="$1"
      local encryptionStatus="$(qpdf --show-encryption $file 2>/dev/null)"
      local tempFile=""
      local password=""
      if [[ "$encryptionStatus" == "File is not encrypted" ]]; then
          echo $encryptionStatus.
      else
          echo "Passwort: "
          read password

          tempFile=$(mktemp)
          qpdf --password="$password" --decrypt "$file" "$tempFile" && \
              mv "$tempFile" "$file"
          pdf-decrypt-error-handler $?
      fi
  else
      echo \"$1\" is not a file. > /dev/stderr
      exit 1
  fi
}

if [[ $0 == *${__NAME__}* ]]; then
    $__NAME__ "$@"
fi
