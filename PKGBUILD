# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef
pkgver=0.3.0
pkgrel=1
pkgdesc='A declarative manager of Arch packages'
url='https://github.com/steven-omaha/pacdef'
source=("$pkgname-$pkgver.tar.gz::https://github.com/steven-omaha/pacdef/archive/v$pkgver.tar.gz")
arch=('any')
license=('GPL3')
depends=('python')
sha512sums=('7e3bf96a1415d38a240f42bb2fea4b87f180f1cfc9e3c40ca51fb3401584a5c582534876b78819092f0b3b674a531b87441f45d6648087ff2b67b35e3cc13c84')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 pacdef "${pkgdir}/usr/bin/pacdef"
}
