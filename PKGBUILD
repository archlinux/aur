# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=13.2.0-10889
pkgver=${_pkgver/-/.}
pkgrel=0
pkgdesc="Use multiple internet connections in parallel"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://speedify.com/"
license=(unknown)
groups=()
depends=( speedify libayatana-appindicator webkit2gtk)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
source_x86_64=(http://apt.connectify.me/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${_pkgver}_amd64.deb)
source_aarch64=(http://apt.connectify.me/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${_pkgver}_arm64.deb)
source_armv7h=(http://apt.connectify.me/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${_pkgver}_armhf.deb)
# TODO: i386 is also supported
md5sums_x86_64=('064ce3c69fb6a643a7a33fc99df8d791')
sha256sums_x86_64=('08081ab42b1e0d783f206abfee4d728e003a37dd4984523f1febf44f196dfa45')
sha512sums_x86_64=('62f3c1cdf32cf28e336d2b20858a19427b7b81f7fe93a1ecd2fb971ca45a622363d70441962075746a5643fdda7a584c09a9ae010625f78f9a2cfe49961d71df')
md5sums_aarch64=('SKIP')
md5sums_armv7h=('SKIP')

prepare() {
	cd "$srcdir"
	tar -xf "${srcdir}/data.tar.gz"
}

package() {
	cd "${srcdir}"
	cp -rp usr "${pkgdir}/usr"
}
