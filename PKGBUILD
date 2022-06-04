# Maintainer: ZakkeX <roskahiiri@gmail.com>
pkgname=otarustlings-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Otarustlings exercise platform"
arch=(x86_64)
url="https://gitlab.com/otafablab/otarustlings"
license=('MIT')
depends=(rust)
provides=(otarustlings)
conflicts=(otarustlings)
source=("otarustlings-$pkgver::https://gitlab.com/otafablab/otarustlings/-/package_files/41564868/download")
sha256sums=("5c650ecad8bc2de770c03cb9f6ca9fa07f71a425651f60c79357662dfd3e2af0")

package() {
	install -Dm 755 "otarustlings-$pkgver" "$pkgdir/usr/bin/otarustlings"
}
