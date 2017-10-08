# Maintainer: Francisco Domínguez Lerma <francisco.dominguez.lerma@gmail.com>
pkgname=sps
pkgver=git
pkgrel=1
pkgdesc="Simple escaner de puertos escrito en python3"
arch=('any')
url="https://github.com/sonozaki/sps"
license=('GPL')
groups=()
depends=('python3')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/sonozaki/sps/archive/master.zip)
noextract=()
md5sums=('000c887a2a58e90fd74fcadfc3406123')

package() {

cd "$srcdir/sps-master"
chmod +x sps.py
mkdir -p "$pkgdir/usr/bin"
cp sps.py "$pkgdir/usr/bin/sps"

}

