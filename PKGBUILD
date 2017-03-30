# Maintainer: Leonhard Rose <kolonigulus@gmail.com>
pkgname=storjshare-daemon
pkgver=2.5.1
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
md5sums=('SKIP')
validpgpkeys=()

package() {
	sudo npm install --global "v${pkgver}.tar.gz"
}


