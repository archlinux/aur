# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=17.0.2-12938
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
md5sums_x86_64=('fc4e7389dbaf51e5b10f909e154f334c')
sha256sums_x86_64=('6b3638a1cd4d0e20dfb57621d0fc8095c27dc0ead0d034121e857fed6852e712')
sha512sums_x86_64=('ecb2a199c07c3f72a3dd90c689e56af88683a2403d74c35010484a66108d63c63153a39c3fdfbaaa56d048ca7f807a61536c0abb33f3acc1688671d878c49a18')
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
