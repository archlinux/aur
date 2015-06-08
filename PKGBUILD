# Maintainer: Robert Orzanna <orschiro at gmail dot com>

pkgname=sxiv-rifle
pkgver=1.3
pkgrel=1
pkgdesc="Browse through images in directory after opening a single file"
arch=('i686' 'x86_64')
url="https://wiki.archlinux.org/index.php/Sxiv#Browse_through_images_in_directory_after_opening_a_single_file"
license=('GPL2')
depends=('sxiv')
source=('sxiv-rifle.sh' 'sxiv-rifle.desktop')
md5sums=('47069e805adcb7654ec3612dde1ee126'
         '22b56f46c4681b0cb6babdf43bb1d13f')

package() {
  cd "$srcdir"
  install -Dm755 sxiv-rifle.sh "$pkgdir/usr/bin/sxiv-rifle"
  install -Dm644 sxiv-rifle.desktop "$pkgdir/usr/share/applications/sxiv-rifle.desktop"
}

# vim:set ts=2 sw=2 et:
