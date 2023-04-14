# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=13.2.1-10893
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
md5sums_x86_64=('b6588cc0762415c2652bd97ec46cfe63')
sha256sums_x86_64=('8de46d4c9c374ab6e46fd2b3e6bb28dc1213cb77648b1d0c1a13f99b14a49ff6')
sha512sums_x86_64=('04f6d838056955861db7cbd8aeb69f7d215b0dbaf4ba8d64fd814d536de95492c2202a7f31e59a0969adb3a35a6fbbe1e4524d703d19adebf1eadf8419d709c4')
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
