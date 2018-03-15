pkgname=storjshare-daemon
pkgver=5.3.1
pkgrel=1
epoch=
pkgdesc="A CLI Client for running a farming node"
arch=('any')
url="https://github.com/Storj/storjshare-daemon"
license=('AGPL3')
groups=()
makedepends=('npm' 'make' 'gcc' 'git')
depends=('nodejs-lts-carbon' 'python2>=2.7.0')
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
sha256sums=('56b29b13dc85035f00477ec28b203c1699dbb86efdc8e239c9c2dfb1458d764e')

package() {
	cd "$srcdir"
	npm install --user root -g --prefix "$pkgdir/usr" "v${pkgver}.tar.gz"

	chmod -R o-w "$pkgdir"
}
