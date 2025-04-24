# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=15.5.1-12423
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
md5sums_x86_64=('104e7f77d64b688917b37423ced959e7')
sha256sums_x86_64=('a453df0b8dd71a93ade62d4d92cb411ba2dadd371482289309313498a2d506e5')
sha512sums_x86_64=('d731819805cfaa1425e81218b6802671e2b899a2a80ce37912b2a7984f37432e5171c5dcd90a8c50d8d4336ff5f7fb19fc8aedadd6abaade90b8d599c74b275e')
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
