# Maintainer:
# Contributor: JPratama7 <josepratama080@gmail.com>
# Contributor: Dominik Adrian Grzywak <starterx4 at gmail dot com>

_pkgname="thorium-browser"
pkgname="$_pkgname-bin"
pkgbase="$pkgname"
pkgver=130.0.6723.174
pkgrel=1
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
    _hash='b2bf1fe04df6f55ac0d621e317eef60dbe290294edf6e0d3ce87ebdc093ae56a'
    source "$startdir"/PKGBUILD.base
    ;;
  'x86_64_v2')
    _hash='dbfc1ae4148b2a19d144c3742c66b6e7125e47b49c38f068cbd7c2512ec891e0'
    source "$startdir"/PKGBUILD.sse4
    ;;
  'x86_64_v3')
    _hash='4de0f0c7b06acb435268d04cbb309fe0efab8168c1fed988bc38094271954866'
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
