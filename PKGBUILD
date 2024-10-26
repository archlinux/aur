# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=xfce-config-helper
pkgver=1.1
pkgrel=1
pkgdesc='Tools to help manage Xfce configurations'
depends=('ruby' 'ruby-dbus')
url="https://github.com/felipec/$pkgname"
arch=('any')
license=('ISC')
makedepends=('git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha1sums=('6874ffecf25eafe72c531e919c4d2f65fd857a86')

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" make prefix=/usr install
}
