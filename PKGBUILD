# Maintainer: Tea <icepie.dev@gmail.com>
pkgname=giwifi-gear.sh
pkgver=1.3.4
pkgrel=1
pkgdesc="A UNIX shell command line interpreter tool for giwifi"
arch=('any')
url=""
license=('GPL')
groups=()
depends=(
  'curl'
  'bash'
  'openssl'
)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname)
noextract=()
sha256sums=('SKIP')

build() {
    ls -al
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp $pkgname $pkgdir/usr/bin
    chmod +x $pkgdir/usr/bin/$pkgname
}
