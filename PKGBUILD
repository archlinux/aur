# Maintainer: Aloxaf <aloxafx at gamil>

pkgname=jbr-linux-x64
_pkgver=17.0.7-b1000.6
pkgver=17.0.7b1000.6
pkgrel=1
epoch=1
pkgdesc="A patched JetBrainsRuntime which fix fcitx5 cursor bug"
arch=('x86_64')
url='https://github.com/ayanamist/JetBrainsRuntime-for-fcitx'
options=('!strip')
license=('custom')
source=(
  "https://github.com/ayanamist/JetBrainsRuntime-for-fcitx/releases/download/jbr-release-${pkgver}/jbr_jcef-${_pkgver%-*}-linux-x64-${_pkgver#*-}.tar.gz"
  'jbr-linux-x64.install'
)
sha256sums=(
  'a9259b99f43fd9b485303c01164a184b9886f820b67528a67a2c75c62b5bbc7a'
  '29a37d3d9c6059f688d91187ff0a249c90f2ddb1add3ff980e0fe0619a5411ec'
)
install=jbr-linux-x64.install

package() {
  install -dm755 "${pkgdir}/opt"
  cp -a "${srcdir}/jbr_jcef-${_pkgver%-*}-linux-x64-${_pkgver#*-}" "${pkgdir}/opt/jbr-linux-x64"
}

