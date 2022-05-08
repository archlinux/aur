# Maintainer: Aloxaf <aloxafx at gamil>

pkgname=jbr-linux-x64
_pkgver=2022-04-15_00-02
pkgver=20220415
pkgrel=1
pkgdesc="A patched JetBrainsRuntime which fix fcitx5 cursor bug"
arch=('x86_64')
url='https://github.com/RikudouPatrickstar/JetBrainsRuntime-for-Linux-x64'
options=('!strip')
license=('custom')
source=(
  "https://github.com/RikudouPatrickstar/JetBrainsRuntime-for-Linux-x64/releases/download/${_pkgver}/${pkgname}-${_pkgver}.zip"
  'jbr-linux-x64.install'
)
sha256sums=(
  '0ed574567482600cd00191ebdbf85940fadcda3ff9cbfa7d19beb1b0e0f6346f'
  '29a37d3d9c6059f688d91187ff0a249c90f2ddb1add3ff980e0fe0619a5411ec'
)
install=jbr-linux-x64.install

package() {
  install -dm755 "${pkgdir}/opt"
  cp -a "${srcdir}/jbr" "${pkgdir}/opt/jbr-linux-x64"
}

