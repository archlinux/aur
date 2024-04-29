# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Co-Maintainer: p0ryae

pkgname=lazap-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Lightweight cross-platform client, unifying games into a single, modern library 🎮 (binary release)"
url="https://github.com/Lazap-Development/Lazap"
license=('CC-BY-NC-SA-4.0')
arch=('x86_64')
depends=('libayatana-appindicator' 'libxtst' 'webkit2gtk')
provides=("lazap")
conflicts=("lazap")
source=("$url/releases/download/v$pkgver/lazap_${pkgver}_amd64.deb")
sha256sums=('d6331919c80aa42cf4950ac7800e045c95a2b817732f45d59da0b0614c42ee01')

prepare() {
  tar -xf data.tar.gz
}

package() {
  mv usr "$pkgdir"
}
