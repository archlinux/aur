# Maintainer: Tea <icepie.dev@gmail.com>
pkgname=giwifi-gear.sh
pkgver=1.2.6
pkgrel=1
pkgdesc="A UNIX shell command line interpreter tool for giwifi"
arch=('any')
url="giwifi-gear.sh"
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
sha256sums=('09d13045d38d3e1b452146b51559c603f54dcdc95aefede6520f09a8db07d990')

build() {
    ls -al
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp $pkgname $pkgdir/usr/bin
    chmod +x $pkgdir/usr/bin/$pkgname
}
