# Maintainer: tak0dan
pkgname=sunshine-store
pkgver=0.1.0
pkgrel=1
pkgdesc="Microsoft-Store-style app shop for Arch: pacman, AUR and Flatpak in one search"
arch=('any')
url="https://github.com/tak0dan/sunshine-store"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyqt6' 'polkit' 'pacman')
optdepends=('yay: install AUR packages'
            'flatpak: install Flatpak apps')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c8fb8ace50e576db38408b19792aa2627801d5d580becf506967c3f283ed92c6')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
