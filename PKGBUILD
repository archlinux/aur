# Maintainer: Damian Miller <rysas@mail.naimad.dev>
pkgname=lumoria-bin
pkgver=0.2.0
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
source=("lumoria-$pkgver-x86_64.tar.zst::https://builds.lumoria.dev/arch/lumoria-$pkgver-x86_64.tar.zst")
sha256sums=('cb1beafde5201923a1ef881204fd05b6e53edf8752c95edfcf51feae9216fa89')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
