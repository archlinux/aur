# Maintainer: Aloxaf <aloxafx at gamil>

pkgname=jbr-linux-x64
_pkgver=2022-04-15_00-02
pkgver=17.0.4b469.46
pkgrel=1
epoch=1
pkgdesc="A patched JetBrainsRuntime which fix fcitx5 cursor bug"
arch=('x86_64')
url='https://github.com/RikudouPatrickstar/JetBrainsRuntime-for-Linux-x64'
options=('!strip')
license=('custom')
source=(
  "https://github.com/RikudouPatrickstar/JetBrainsRuntime-for-Linux-x64/releases/download/jbr-release-17.0.4b469.46/jbr_jcef-17.0.4-linux-x64-b469.46.tar.gz"
  'jbr-linux-x64.install'
)
sha256sums=(
  'e1ed648bfcb1a3c44d3350d531fdc40e792464835145028447848d2f0143db51'
  '29a37d3d9c6059f688d91187ff0a249c90f2ddb1add3ff980e0fe0619a5411ec'
)
install=jbr-linux-x64.install

package() {
  install -dm755 "${pkgdir}/opt"
  cp -a "${srcdir}/jbr_jcef-17.0.4-x64-b469" "${pkgdir}/opt/jbr-linux-x64"
}

