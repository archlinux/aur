# Maintainer: levinit <levinit@outlook.com>
pkgname=adhosts
pkgver=0.2
pkgrel=3
epoch=
pkgdesc="google hosts and blocking ads hosts.用于科学上网和屏蔽广告的hosts."
arch=(any)
url="https://github.com/levinit/$pkgname"
license=('GPL')
groups=()
depends=('git' 'curl')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git://github.com/levinit/$pkgname.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
        cd $srcdir/$pkgname/
        sed -i '/adhosts/d' $pkgname
}
#build() {
#}
#check() {
#}

package() {
        cd $srcdir/$pkgname/
        install -Dm755 $pkgname "$pkgdir/usr/bin/adhosts"
}
