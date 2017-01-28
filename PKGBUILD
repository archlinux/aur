# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=tanha-fonts
pkgver=0.4.1
pkgrel=2
pkgdesc="A beautiful Persian font based on Samim and Vazir font."
url="https://rastikerdar.github.io/tanha-font/"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-tanha' "$pkgname")
conflicts=('ttf-tanha' "$pkgname")
replaces=('ttf-tanha')
source=("$pkgname-$pkgver.zip::https://github.com/rastikerdar/tanha-font/archive/master.zip")
sha256sums=('3e7ab70fca0198bf9c92193a37d5101b5a019437c2fbc38a0246cab8a3d7b6c2')

package() {
  cd tanha-font-master
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./dist/Tanha.{eot,ttf,woff}
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
