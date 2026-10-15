# Maintainer: Damian Miller <rysas@mail.naimad.dev>
pkgname=lumoria-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="A Linux installer and launcher for Final Fantasy XI"
arch=('x86_64')
url="https://github.com/Windower/Lumoria"
license=('GPL-3.0-or-later')
provides=('lumoria')
conflicts=('lumoria')
depends=(
  'gtk4'
  'json-glib'
  'libadwaita'
  'libarchive'
  'libgee'
  'libgit2-glib'
  'libmspack'
  'libsoup3'
  'libmanette'
  'libportal'
  'libportal-gtk4'
  'vte4'
  'libxml2'
)
source=("lumoria-$pkgver-$pkgrel-x86_64.tar.zst::https://builds.lumoria.dev/arch/lumoria-$pkgver-$pkgrel-x86_64.tar.zst")
sha256sums=('f82240eba1c42fa33941ec74a517b3e8ea950f4c752bbb6fb069cd37a7d0861f')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
