# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=hashem
pkgver=0.07
pkgrel=1
pkgdesc="Mr. Hashemi Programming Language"
url="https://github.com/mr-hashemi/mr-hashemi"
arch=(any)
license=('UPL')
source=("${pkgname}-${pkgver}::${url}/releases/download/${pkgver}/hashem"
	"https://raw.githubusercontent.com/mr-hashemi/mr-hashemi/master/LICENSE")

sha256sums=('5dffaecf80c61bd0e9ed338e5035fd2943b3e9c91330d445fdac7941cb3af6a4'
	    '9c93d0dd0b920a1710d7739412ea00e78fc81e21c1afeaf8c794630e3f42af42')

package() {
  install -Dm755 "${srcdir}/hashem-${pkgver}" "${pkgdir}/usr/bin/hashem"
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/LICENSE"
}
