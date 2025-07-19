# Maintainer: Miquel Lionel <lionel@les-miquelots.net>
pkgname=samsung-ssd-fwupdate
pkgver=1.1
pkgrel=2
pkgdesc="A script to ease downloading and updating Samsung SSD firmware on Linux."
url="https://git.les-miquelots.net/samsung-ssd-fwupdate"
arch=('x86_64')
license=('MIT')
depends=('curl' 'unzip')
conflicts=("$pkgname-git")
provides=("$pkgname")
source=("https://git.les-miquelots.net/$pkgname/snapshot/$pkgname-$pkgver.zip")
sha256sums=('5a43b8961d6f8a7ae901340bb8b2239b8cf764ea8790ba43db22e8d09e3947a8')

package() {
  #mkdir -p "${pkgdir}/usr/local/sbin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" -t "${pkgdir}/usr/local/sbin/"
}
