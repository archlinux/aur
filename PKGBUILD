# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=vazir-code-fonts
pkgver=1.0.3
pkgrel=1
pkgdesc="A beautiful monospace Persian font based on Vazir and Inconsolata fonts."
url="https://rastikerdar.github.io/vazir-code-font/"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-vazir-code' "$pkgname")
conflicts=('ttf-vazir-code' "$pkgname")
replaces=('ttf-vazir-code')
source=("$pkgname-$pkgver.zip::https://github.com/rastikerdar/vazir-code-font/releases/download/v$pkgver/vazir-code-font-v$pkgver.zip")
sha256sums=('8a0bcc3e0ab9f086aeb3d8d2827825dc5b582f34562ad4c0b6f79242a692249a')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Vazir-Code*.{eot,ttf,woff}
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
