# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=14.5.3-11694
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
md5sums_x86_64=('db2c8f872c1cf8c0c772430bf13ea5e6')
sha256sums_x86_64=('1174eaa13845bcd207a3e35afeb976d13d4ab3e19329af4eba09f900d720327d')
sha512sums_x86_64=('7d23660f074898d9a4393e52d297e90ae1a891e06d0cf23b8e597f3802c58b0de14d0e1bebbbde8cd53bad811a217e35ce825ea3ee32bacacaacf0ffb6c2efb4')
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
