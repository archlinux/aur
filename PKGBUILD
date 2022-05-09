# Maintainer: ZakkeX <roskahiiri@gmail.com>
pkgname=otarustlings-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="Otarustlings exercise platform"
arch=(x86_64)
url="https://gitlab.com/otafablab/otarustlings"
license=('MIT')
depends=(rust)
provides=(otarustlings)
conflicts=(otarustlings)
source=("otarustlings-$pkgver::https://gitlab.com/otafablab/otarustlings/-/package_files/37223163/download")
sha256sums=("e890f801dda7a755ebca4d92d6fa03e6220c788cc6d6aece16f9a9d00e707d7a")

package() {
	install -Dm 755 "otarustlings-$pkgver" "$pkgdir/usr/bin/otarustlings"
}
