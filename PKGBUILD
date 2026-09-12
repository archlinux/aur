# Maintainer: Damian Miller <rysas@mail.naimad.dev>
pkgname=lumoria-bin
pkgver=0.2.0
pkgrel=3
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
sha256sums=('c71fba4123110efe211458d5ad341aada032e9f6fb89847e34fb816c3243bf56')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
