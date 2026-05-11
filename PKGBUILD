# Maintainer: Akrata
pkgname=akp
pkgver=1.0.0
pkgrel=1
pkgdesc="A package manager wrapper for pacman, yay and flatpak"
arch=('any')
url="https://github.com/Akr4ta/$pkgname"
license=('GPL3')
depends=('bash' 'expac' 'gawk' 'ncurses' 'pacman' 'pacman-contrib' 'sed' 'util-linux')
makedepends=(git)
optdepends=(
  'yay: for AUR support'
  'flatpak: for Flatpak support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Akr4ta/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('63fe48ac698871b00a9b564ca1e9cd9d2683738e652b472ba8f345c590dd1775')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/akp"
}
