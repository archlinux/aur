# Maintainer: Aloxaf <aloxafx at gamil>

pkgname=jbr-linux-x64
_pkgver=17.0.6-b829.5
pkgver=17.0.6b829.5
pkgrel=1
epoch=1
pkgdesc="A patched JetBrainsRuntime which fix fcitx5 cursor bug"
arch=('x86_64')
url='https://github.com/RikudouPatrickstar/JetBrainsRuntime-for-Linux-x64'
options=('!strip')
license=('custom')
source=(
  "https://github.com/RikudouPatrickstar/JetBrainsRuntime-for-Linux-x64/releases/download/jbr-release-${pkgver}/jbr_jcef-${_pkgver%-*}-linux-x64-${_pkgver#*-}.tar.gz"
  'jbr-linux-x64.install'
)
sha256sums=(
  'b02ca9cc4c584dcaee643a6790f13b9269f5cc291a686a53cc11bcbc1d41faf8'
  '29a37d3d9c6059f688d91187ff0a249c90f2ddb1add3ff980e0fe0619a5411ec'
)
install=jbr-linux-x64.install

package() {
  install -dm755 "${pkgdir}/opt"
  cp -a "${srcdir}/jbr_jcef-${_pkgver%-*}-linux-x64-${_pkgver#*-}" "${pkgdir}/opt/jbr-linux-x64"
}

