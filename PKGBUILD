# Maintainer:
# Contributor: JPratama7 <josepratama080@gmail.com>
# Contributor: Dominik Adrian Grzywak <starterx4 at gmail dot com>

_pkgname="thorium-browser"
pkgname="$_pkgname-bin"
pkgbase="$pkgname"
pkgver=128.0.6613.189
pkgrel=2
pkgdesc="Chromium fork focused on high performance and security"
url="https://github.com/Alex313031/Thorium"
license=('BSD-3-Clause')
arch=('i386' 'x86_64' 'x86_64_v2' 'x86_64_v3')

options=('!emptydirs' '!strip' '!debug')

case "$CARCH" in
  'i386')
    pkgver=123.0.6312.134 # i386
    _hash='3b34f0e25de9c797e0927e98793ad43730272fc1b35ea31301d88e21e6743fc7'
    source "$startdir"/PKGBUILD.i386
    ;;
  'x86_64')
    # SSE3 version because there is no v1 version
    _hash='83ea4d4d5590ef6ca0ba90f0b77053ad5c18d69a0ec8780d27f472ae7478fa07'
    source "$startdir"/PKGBUILD.base
    ;;
  'x86_64_v2')
    _hash='b3dce89c2e3c5e157df0c570b5dc0ac53baae7e67af1a9801e0cd9ee41e4ff95'
    source "$startdir"/PKGBUILD.sse4
    ;;
  'x86_64_v3')
    _hash='a2277bd84e27f63010b0252bced9728f9e86774fa9cfbdf9cba6f908e300e2d8'
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
