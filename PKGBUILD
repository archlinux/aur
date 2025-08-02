# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=15.7.2-12561
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
md5sums_x86_64=('551b5aafd98a62e53b6c2ce517b0124c')
sha256sums_x86_64=('876d1f29def620a60017be3e56758f8e58dadc97dc69993aa23fcf7c477d3ed6')
sha512sums_x86_64=('aa7c4b386c508308b699fc8aa86ee6dabc26d15bc3d08e829e53e86565e99f316c9b67ba865022c831fb7e3c8dceeaa64cd771eb30b155f7a941b4289243ca06')
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
