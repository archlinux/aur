# Maintainer: slothgrind <slothgrind@proton.me>

pkgname='pass-xkcd'
pkgver=0.0.2
pkgrel=1
pkgdesc='A pass extension for generating xkcd-style passphrases.'
arch=('any')
url='https://gitlab.com/slothgrind/pass-xkcd'
license=('GPL3')
depends=('pass' 'words')
source=("https://gitlab.com/slothgrind/pass-xkcd/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('101a4fbeceb2493686b0cd79f829204fbdd8b723cf93aa9ee24c174e8967f80f')

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
}
