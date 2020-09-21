# Maintainer: Everett B. everettbutts@hotmail.com
pkgname=natural-wallpaper-collection-git
pkgver=1.0.3
pkgrel=1
pkgdesc="A collection of backgrounds/wallpapers. Themed around natural colors and subject matter."
arch=('any')
license=('GPL3')
install=""
url="https://github.com/Can221-ParOS/natural-wallpaper-collection-git.git"
source=("git+$url")
makedepends=('git')
sha512sums=('SKIP')
conflicts=( "natural-wallpaper-collection-git")
provides=("natural-wallpaper-collection-git=$pkgver")

pkgver() {
  cd "$pkgname"
  git describe --tag
}

package() {
    install -dm 755 $pkgdir/usr/share/backgrounds/natural-wallpaper-collection
    cp -r --no-preserve=ownership natural-wallpaper-collection-git/natural-wallpaper-collection $pkgdir/usr/share/backgrounds
}
