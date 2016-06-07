# Maintainer: Will Price <will.price94+aur@gmail.com>
pkgname=gdub-git
pkgver=r31.fd7c8a8
pkgrel=1
epoch=
pkgdesc="A gradle wrapper wrapper to make gradlew easier to use"
arch=('any')
url="www.gdup.rocks"
license=('MIT')
groups=()
depends=('jdk')
makedepends=()
checkdepends=()
optdepends=('gradle')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/dougborg/gdub.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%%-git}"
    mkdir -p "$pkgdir/usr/share"
    ./install "$pkgdir/usr/share"
}
