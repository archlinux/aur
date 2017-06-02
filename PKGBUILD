# Contributor: levinit <levinit@outlook.com>
# Maintainer: levinit <levinit@outlook.com>
pkgname=adhosts
pkgver=0.1
pkgrel=2
epoch=
pkgdesc="google hosts and blocking ads hosts.用于科学上网和屏蔽广告的hosts."
arch=(any)
url="https://github.com/levinit/adhosts"
license=('GPL')
groups=()
depends=('wget')
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
source=("https://github.com/levinit/adhosts/archive/master.zip")
noextract=()
md5sums=('832e281ef7dec6d9f4bb746e24d10d11')
validpgpkeys=()

prepare() {
        sed -i '/adhosts/d' "$pkgname-master"/adhosts
}
#build() {
#}
#check() {
#}

package() {
        cd "$pkgname-master"
        mkdir -p $pkgdir/usr/bin
        install $pkgname "$pkgdir/usr/bin"
}
