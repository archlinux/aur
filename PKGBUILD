# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=16.5.0-12914
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
md5sums_x86_64=('2a3d699117f1eaeffdb2d76583631f56')
sha256sums_x86_64=('90725ba2328d6747eb35523ce7e0979a7d44bbb7e6e86cbe33a6500ce1142a0e')
sha512sums_x86_64=('5699cc7c17eff49adbf6598d723d139123c318a13c36ceb270589bc02e63e1e13ed151321ecf20cddbdaf97e19c46789f09a94b4b23b6449ee18de3146bd728b')
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
