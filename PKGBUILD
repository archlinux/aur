# Maintainer: Miquel Lionel <lionel@les-miquelots.net>
pkgname=samsung-ssd-fwupdate
pkgver=1.0
pkgrel=1
pkgdesc="A script to ease downloading and updating Samsung SSD firmware on Linux."
url="https://git.les-miquelots.net/samsung-ssd-fwupdate"
arch=('x86_64')
license=('MIT')
depends=('curl' 'unzip')
conflicts=("$pkgname-git")
provides=("$pkgname")
source=("https://git.les-miquelots.net/$pkgname/snapshot/$pkgname-$pkgver.zip")
sha256sums=('9c7a924db76c19edc0bb21724eeb7020dc5cf6128e7bbffb5a44f3b054d173f2')

package() {
  #mkdir -p "${pkgdir}/usr/local/sbin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" -t "${pkgdir}/usr/local/sbin/"
}
