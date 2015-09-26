# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com> 
# Contributor: Arkham <arkham at archlinux dot us> 
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>

pkgname=arc-colors-revival
pkgver=0.1
pkgrel=1
pkgdesc='Arc Colors wallpapers'
arch=('i686' 'x86_64')
url='https://github.com/Somasis/arc-colors-revival'
license=('GPL')
optdepends=('gtk-theme-gnome-colors-revival'
            'gtk-theme-shiki-colors-revival')
source=("arc-colors-revival-$pkgver.tar.gz::https://github.com/Somasis/arc-colors-revival/archive/v$pkgver.tar.gz")
sha256sums=('a3234ab6a7826537595c0e01e6bed467eb9be0be0bb148c6942d2551115a01d2')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install 
}
