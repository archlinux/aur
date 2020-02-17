# Maintainer: Jan Novotny <shadenk30011@gmail.com>
pkgname=wpa_wrapper
pkgver=1.0
pkgrel=1
pkgdesc="Network management utility."
arch=(any)
url=""
license=('GPL3')
depends=(sudo iw wpa_supplicant python3 net-tools)
makedepends=(git)
source=("$pkgname::git+https://github.com/CuBeRJAN/$pkgname-cleanup.git"
		"https://raw.githubusercontent.com/CuBeRJAN/$pkgname-cleanup/master/$pkgname/scripts/main.py")
noextract=()
sha256sums=('SKIP'
			'3da2a1fdf21064eff3389a870feab069b6bf95ab3253e6ce35d6fc7c3bb6d0be')

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
