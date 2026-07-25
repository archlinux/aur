# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=17.0.4-12943
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
md5sums_x86_64=('092dc04dec5163c7e4bf05bed05b8d17')
sha256sums_x86_64=('3d766992801259d01f8d88a9adb27964b55426a0f553ae2fd1ad4cfca3e842be')
sha512sums_x86_64=('ae63006b9394c188de5d0c24e7f63b513fdcb69c45bc49714de46d5b6aee6202ceb1bf6cf149d659686dca6a9460fb179aa59b51d088ff5a7f8f5856b1c8ebb8')
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
