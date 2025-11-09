# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=16.0.3-12749
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
md5sums_x86_64=('4c298b6ebc2f53d29989e16a0843de25')
sha256sums_x86_64=('8bb492a5211be610b83ef66b8b091b1dc9d132c15ca1db476247c95a0eb53a71')
sha512sums_x86_64=('b7b7f77f3a55b71b6955bec4b5459a439a76e47620d99e9c57020b7b29fe907aca72dd2dd60cce9cfce18c7717e3fba12280c371d0a833543e37c68495bcb7de')
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
