# Maintainer: Afio Vinícius <afiovinicius@gmail.com>
pkgname=note-liber-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Note Liber is a simple sticky notes app for Linux."
arch=('x86_64')
url="https://github.com/afiovinicius/note-liber"
license=('MIT')
depends=(
  'webkit2gtk-4.1' 
  'base-devel' 
  'curl' 
  'wget' 
  'file' 
  'openssl' 
  'appmenu-gtk-module' 
  'libappindicator-gtk3' 
  'librsvg'
  'inter-font'
  'ttf-hack'
)
makedepends=('dpkg' 'rust' 'npm' 'nodejs' 'cargo-tauri')
source=("$url/releases/download/$pkgver/note-liber"_"$pkgver"_amd64.deb)
sha256sums=('SKIP')

build() {
  echo "Start install and config Note Liber"
}

package() {
  dpkg-deb -x "$srcdir/note-liber"_"$pkgver"_amd64.deb "$pkgdir"
}
