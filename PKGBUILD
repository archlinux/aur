# Maintainer: glowiak <glowiak1111@yandex.com>
pkgname=pamod-git
pkgver=master
pkgrel=1
pkgdesc="Simple bash-based pacman wrapper that lets you install AUR packages and do some other things"
arch=(any)
url="http://codeberg.org/glowiak/pamod"
license=('GPL2')
groups=()
depends=("bash" "curl" "git" "package-query")
makedepends=()
optdepends=()
keywords=("AUR" "helper" "pacman" "bash" "wrapper")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://codeberg.org/glowiak/pamod/archive/${pkgver}.tar.gz)
noextract=()
sha256sums=('SKIP')


package() {
    cd pamod
    make DESTDIR="$pkgdir/" install
}
