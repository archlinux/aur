# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=transgender-wallpapers
pkgver=1.1
pkgrel=1
pkgdesc='Collection of HD Transgender and non-binary pride wallpapers'
arch=(any)
url='https://github.com/barfin/transgender-wallpapers-for-linux'
license=(unknown)
source=("$url/releases/download/v$pkgver/transgender-wallpapers-for-linux-$pkgver.tar.gz")
md5sums=('d938a7dc6237f4139c272c424ae9abf6')

package() {
#  cd "transgender-wallpapers-for-linux"
  install -Dm644 -t "$pkgdir/usr/share/backgrounds/transgender/" img/*
  install -Dm644 -t "$pkgdir/usr/share/gnome-background-properties/" transgender-backgrounds.xml
}
