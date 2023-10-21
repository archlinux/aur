# Maintainer: Aloxaf <aloxafx at gamil>

pkgname=jbr-linux-x64
_pkgver=17.0.8.1-b1080.1
pkgver=17.0.8.1b1080.1
pkgrel=1
epoch=1
pkgdesc="A patched JetBrainsRuntime which fix fcitx5 cursor bug"
arch=('x86_64')
url='https://github.com/AlanSune/JetBrainsRuntime-for-Linux-x64'
options=('!strip')
license=('custom')
source=(
  "https://github.com/AlanSune/JetBrainsRuntime-for-Linux-x64/releases/download/jbr-release-${pkgver}/jbr_jcef-${_pkgver%-*}-linux-x64-${_pkgver#*-}.tar.gz"
  'jbr-linux-x64.install'
)
sha256sums=(
  '4409917fd1df80d0dcc157ad4e1bef8e45807d761bcdb2b2fd5a106600df8b08'
  '29a37d3d9c6059f688d91187ff0a249c90f2ddb1add3ff980e0fe0619a5411ec'
)
install=jbr-linux-x64.install

package() {
  install -dm755 "${pkgdir}/opt"
  cp -a "${srcdir}/jbr_jcef-${_pkgver%-*}-linux-x64-${_pkgver#*-}" "${pkgdir}/opt/jbr-linux-x64"
}

