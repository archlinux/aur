# Maintainer: Leonhard Rose <kolonigulus@gmail.com>
pkgname=storjshare-daemon
pkgver=3.1.0
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
md5sums=('d3fb8b863037f736d03e37e8406c98ef')

package() {
cd "$srcdir"
npm install --user root -g --prefix "$pkgdir/usr" "v${pkgver}.tar.gz"
}


