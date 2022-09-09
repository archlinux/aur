# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=xfce-config-helper
pkgver=1.0
pkgrel=1
pkgdesc='Tools to help manage Xfce configurations'
depends=('ruby' 'ruby-dbus')
url="https://github.com/felipec/$pkgname"
arch=('any')
license=('ISC')
makedepends=('git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha1sums=('656b6e5bd76d5eb89658a5a57ee3aff00a04cbca')

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" make prefix=/usr install
}
