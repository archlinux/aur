# Maintainer: Leonhard Rose <kolonigulus@gmail.com>
pkgname=storjshare-daemon
pkgver=3.4.0
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
md5sums=('cc2a0db8f9b529fd286368d451ac2543')

package() {
cd "$srcdir"
npm install --user root -g --prefix "$pkgdir/usr" "v${pkgver}.tar.gz"
}


