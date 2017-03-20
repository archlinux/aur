pkgname=fortune-mod-ru
pkgver=1.52
pkgrel=1
pkgdesc=""
arch=("any")
url=""
license=('GPL')
groups=()
depends=("fortune-mod")
makedepends=()
checkdepends=()
optdepends=()
conflicts=()
source=("http://jack.kiev.ua/filez/fortune-mod-ru-$pkgver.tar.bz2")
sha256sums=("4df6487d6607c65002544aa7bb22219a3e0b7ab9a4bd3e39fa21526529dd16c9")
replaces=()
backup=()
changelog=ChangeLog

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
