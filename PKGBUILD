# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=14.4.0-11582
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
md5sums_x86_64=('6ec3dbf3e8f5a2dfc522754ccd2860df')
sha256sums_x86_64=('e900bc622cbe2f922c979a5bc809cb23e6309b91c3637bf92458281f7a579b41')
sha512sums_x86_64=('79b6c581f31c0a966377bf8a780f7160e6033de5dae71e0c3e91b010f787bc95c0f990d39addb76ef6d8415c7568a2aac3aac16440e9a08c58635d588a0902b9')
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
