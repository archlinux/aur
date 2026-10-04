#!/bin/sh
# Omotac: pod X11 tekst se crta "bold"/razmazan bez ovoga (A69 9j).
# Vrijednost koju je korisnik vec postavio se postuje.
: "${WEBKIT_DISABLE_DMABUF_RENDERER:=1}"
export WEBKIT_DISABLE_DMABUF_RENDERER
exec /usr/lib/mdai/mdai "$@"
