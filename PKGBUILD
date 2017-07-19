# Maintainer: Leonhard Rose <kolonigulus@gmail.com>
pkgname=storjshare-daemon
pkgver=3.5.0
pkgrel=1
epoch=
pkgdesc="A CLI Client for running a farming node"
arch=('any')
url="https://github.com/Storj/storjshare-daemon"
license=('AGPL3')
groups=()
makedepends=('npm' 'make' 'gcc' 'git')
depends=('nodejs-lts-boron' 'python2>=2.7.0')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=(storjshare-cli)
backup=()
options=()
install=
changelog=
source=("https://github.com/Storj/storjshare-daemon/archive/v${pkgver}.tar.gz")
noextract=("v${pkgver}.tar.gz")
validpgpkeys=()
sha256sums=('cc8a3759f18414cc68b0ab919f28a7ce4771d0ed4d2a1a231be65bba7b1e3948')

package() {
	cd "$srcdir"
	npm install --user root -g --prefix "$pkgdir/usr" "v${pkgver}.tar.gz"

	chmod -R o-w "$pkgdir"
}


