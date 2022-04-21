# Maintainer: ZakkeX <roskahiiri@gmail.com>
pkgname=otarustlings-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Otarustlings exercise platform"
arch=(x86_64)
url="https://gitlab.com/otafablab/otarustlings"
license=('MIT')
depends=(rust)
provides=(otarustlings)
conflicts=(otarustlings)
source=("otarustlings::https://gitlab.com/otafablab/otarustlings/-/package_files/35444305/download")
sha256sums=("bba0d497d6fe034a3abac9a3853ca48085f0be69847ce53852a32d67731adad0")

package() {
	install -Dm 755 otarustlings $pkgdir/usr/bin/otarustlings
}
