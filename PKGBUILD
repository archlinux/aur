# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=malluscript-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Malayalam programming language"
arch=('x86_64')
url="https://github.com/Sreyas-Sreelal/malluscript"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/malluscript-linux-x86_64.tar.gz")
sha256sums_x86_64=('5d54890bc1e073227ae788b43bb7447d42080c439b4ff97fe952606fcff46bc5')

package() {
  install -Dm755 "malluscript" "${pkgdir}/usr/bin/malluscript"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
