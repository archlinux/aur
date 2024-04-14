# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Co-Maintainer: p0ryae

pkgname=lazap-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Lightweight cross-platform client, unifying games into a single, modern library 🎮 (binary release)"
url="https://github.com/Lazap-Development/Lazap"
license=('CC-BY-NC-SA-4.0')
arch=('x86_64')
depends=('libayatana-appindicator' 'libxtst' 'webkit2gtk')
provides=("lazap")
conflicts=("lazap")
source=("$url/releases/download/v$pkgver/lazap_${pkgver}_amd64.deb")
sha256sums=('b00c7733e88198b37bfa50a353ced7c4f6966a21cb328c3e0df6f140ed33f443')

prepare() {
  tar -xf data.tar.gz
}

package() {
  mv usr "$pkgdir"
}
