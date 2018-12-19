# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=zeit-now-bin
pkgver=12.1.12
pkgrel=1
epoch=
pkgdesc="Realtime Global Deployments by Zeit, pre-built binary"
arch=("x86_64")
url="https://zeit.co/now"
# license is according to https://www.npmjs.com/package/now
license=("Apache")
groups=()
depends=("glibc")
makedepends=("gzip")
checkdepends=()
optdepends=()
provides=("zeit-now")
conflicts=("nodejs-now")
replaces=()
backup=()
options=("!strip")
install=
changelog=
source=("https://github.com/zeit/now-cli/releases/download/${pkgver}/now-linux.gz")
noextract=()
md5sums=('9afba0e397058ffb1d2f044a13780d3b')
validpgpkeys=()

build() {
	chmod +x now-linux
}

package() {
	install -D now-linux "${pkgdir}/usr/bin/now"
}
