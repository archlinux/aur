# Maintainer: ZakkeX <roskahiiri@gmail.com>
pkgname=otarustlings-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Otarustlings exercise platform"
arch=(x86_64)
url="https://gitlab.com/otafablab/otarustlings"
license=('MIT')
depends=(rust)
provides=(otarustlings)
conflicts=(otarustlings)
source=("otarustlings-$pkgver::https://gitlab.com/otafablab/otarustlings/-/package_files/35787055/download")
sha256sums=("dd0dc116cd9fc3684bfecd962b41106e60bc766d5f4bfbc44b5012b9e5d2be62")

package() {
	install -Dm 755 "otarustlings-$pkgver" "$pkgdir/usr/bin/otarustlings"
}
