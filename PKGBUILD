# Maintainer: Leonhard Rose <kolonigulus@gmail.com>
pkgname=storjshare-daemon
pkgver=2.5.3
pkgrel=1
epoch=
pkgdesc="A CLI Client for running a farming node"
arch=('any')
url="https://github.com/Storj/storjshare-daemon"
license=('AGPL3')
groups=()
depends=('nodejs>=6.9' 'python2>=2.7.0')
makedepends=('npm' 'make' 'gcc' 'git')
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
md5sums=('cd2ae7b9594e3a4cf918341e5ab9d5a9')
validpgpkeys=()

package() {
cd "$srcdir"
npm install --user root -g --prefix "$pkgdir/usr" "v${pkgver}.tar.gz"
}


