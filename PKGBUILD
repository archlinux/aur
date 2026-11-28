# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gommit-bin
pkgver=2.13.0
pkgrel=1
pkgdesc="Enforce consistent git commit messages"
arch=('x86_64')
url="https://github.com/antham/gommit"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gommit_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('931e9800f67c754e3fb645da94c28ad333b009f2fdcc51f65633e42b94e683c7')

package() {
  install -Dm755 "gommit" "${pkgdir}/usr/bin/gommit"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
