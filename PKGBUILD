# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=17.2.1-12952
pkgver=${_pkgver/-/.}
pkgrel=0
pkgdesc="Use multiple internet connections in parallel"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://speedify.com/"
license=(unknown)
groups=()
depends=( speedify libayatana-appindicator webkitgtk-6.0)
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
md5sums_x86_64=('89e7101caa118b554b13729fded2f165')
sha256sums_x86_64=('c745d56de048adcf3a6027e5bb25340b21e4a3117bf2a7491a629effe4f40887')
sha512sums_x86_64=('13eae4e70be0d59d1c421be49ded14a5abe7ffded008ebdffcce5dec2f365a5252edf820919e54376a689d7a1de972178993c38a53de2db408e3cd214e63f156')
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
