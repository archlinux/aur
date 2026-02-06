# Maintainer: Keithsel <keithsel@disroot.org>
pkgname=dekl
pkgver=0.1.0
pkgrel=1
pkgdesc='Declarative Arch Linux system manager'
arch=('x86_64')
url='https://github.com/Keithsel/dekl'
license=('GPL-3.0-or-later')
depends=('pacman')
optdepends=(
    'paru: AUR support'
    'yay: AUR support'
)
provides=('dekl')
conflicts=('dekl-git')
options=('!strip')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/dekl")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/dekl"
}
