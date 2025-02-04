# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=15.2.0-12271
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
md5sums_x86_64=('391c579fafede27e67cd903316d3da63')
sha256sums_x86_64=('815213a0a382f6a9883fddc104a2ebbb05464a876f66dee10fd10a84d8390e07')
sha512sums_x86_64=('d45edbac9a62d955ef64e3b7f5147c961dff14e6ed8f212197f3818dbb70e52a42ce297d6238f43e7dff65b313cff062e2fd9bad2298ec30345d841b5c51c778')
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
