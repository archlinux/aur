# Maintainer: N.E. Neal <naz dot infante dot neal at outlook dot com>
pkgname='bonsai.sh'
pkgver=1.0
pkgrel=1
pkgdesc="A randomly generated bonsai tree in your terminal!"
arch=('any')
url="https://gitlab.com/jallbrit/bonsai.sh"
license=('GPL')
groups=()
depends=("bash")
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/jallbrit/bonsai.sh/-/archive/master/bonsai.sh-master.tar.gz")
noextract=()
md5sums=(SKIP)

package() {
        cd "$pkgname-master"
        install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
