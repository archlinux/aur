# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=hashem
pkgver=0.04
pkgrel=1
pkgdesc="Mr. Hashemi Programming Language"
url="https://github.com/mr-hashemi/mr-hashemi"
arch=(any)
license=('UPL')
source=("${pkgname}-${pkgver}::${url}/releases/download/${pkgver}/hashem"
	"https://raw.githubusercontent.com/mr-hashemi/mr-hashemi/master/LICENSE")

sha256sums=('a3b2bad566e9043bca1eeaecfdbf8be8d0737d259e804b10ce9c473f608cd951'
	    '9c93d0dd0b920a1710d7739412ea00e78fc81e21c1afeaf8c794630e3f42af42')

package() {
  install -Dm755 "${srcdir}/hashem-${pkgver}" "${pkgdir}/usr/bin/hashem"
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/LICENSE"
}
