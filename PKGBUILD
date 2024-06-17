# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Co-Maintainer: p0ryae

pkgname=lazap-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Lightweight cross-platform client, unifying games into a single, modern library 🎮 (binary release)"
url="https://github.com/Lazap-Development/Lazap"
license=('CC-BY-NC-SA-4.0')
arch=('x86_64')
depends=('libayatana-appindicator' 'libxtst' 'webkit2gtk')
provides=("lazap")
conflicts=("lazap")
source=("$url/releases/download/v$pkgver/lazap-$pkgver-1.x86_64.rpm")
sha256sums=('da92cde6c5036e04dcfb7391526f318b36995d0d3db9fcef9a7bfa78bb10ef5b')

package() {
  mv usr "$pkgdir"
}
