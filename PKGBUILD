# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com> 
# Contributor: Arkham <arkham at archlinux dot us> 
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>

pkgname=gnome-colors-revival
pkgver=0.1.5
pkgrel=1
pkgdesc='GNOME Colors icon theme'
arch=('i686' 'x86_64')
url='https://github.com/Somasis/gnome-colors-revival'
license=('CCPL:by' 'CCPL:by-sa' 'GPL')
optdepends=('gtk-theme-arch-colors-revival'
            'gtk-theme-shiki-colors-revival')
source=("gnome-colors-revival-$pkgver.tar.gz::https://github.com/Somasis/gnome-colors-revival/archive/v$pkgver.tar.gz")
sha256sums=('ed185351f6e0817cec2796cd2c9952b1911260c5ee5334ed6dd117e6ce9d6f43')

build() {
  cd $_pkgname-$pkgver
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install 
}
