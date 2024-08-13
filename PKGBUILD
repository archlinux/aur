# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Co-Maintainer: p0ryae

pkgname=lazap-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="Lightweight cross-platform software, unifying games into a single, modern library (binary release)"
url="https://github.com/Lazap-Development/Lazap"
license=('CC-BY-NC-SA-4.0')
arch=('x86_64')
depends=('gtk3' 'libappindicator-gtk3' 'webkit2gtk' 'xdotool')
provides=("lazap")
conflicts=("lazap")
source=("$url/releases/download/v$pkgver/lazap-$pkgver-1.x86_64.rpm")
sha256sums=('f05a0c398c57001124b43589493d5f5956662b34c9e92ba090f227f546a651d0')

package() {
  mv usr "$pkgdir"
}
