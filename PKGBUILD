# Maintainer:
# Contributor: JPratama7 <josepratama080@gmail.com>
# Contributor: Dominik Adrian Grzywak <starterx4 at gmail dot com>

_pkgname="thorium-browser"
pkgname="$_pkgname-bin"
pkgbase="$pkgname"
pkgver=128.0.6613.189
pkgrel=1
pkgdesc="Chromium fork focused on high performance and security"
url="https://github.com/Alex313031/Thorium"
license=('BSD-3-Clause')
arch=('i386' 'x86_64' 'x86_64_v2' 'x86_64_v3')

options=('!emptydirs' '!strip' '!debug')

case "$CARCH" in
  'i386')
    pkgver=123.0.6312.134 # i386
    source "$startdir"/PKGBUILD.i386
    ;;
  'x86_64')
    # SSE3 version because there is no v1 version
    source "$startdir"/PKGBUILD.base
    ;;
  'x86_64_v2')
    source "$startdir"/PKGBUILD.sse4
    ;;
  'x86_64_v3')
    source "$startdir"/PKGBUILD.avx2
    ;;
esac

source+=(
  'PKGBUILD.avx2'
  'PKGBUILD.base'
  'PKGBUILD.i386'
  'PKGBUILD.sse4'
)
sha256sums+=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)
