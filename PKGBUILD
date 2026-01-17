# Maintainer: daonm <https://github.com/the-daonm>
pkgname=gopac-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A warm, beautiful TUI for Arch Linux package management (Binary)"
arch=('x86_64')
url="https://github.com/the-daonm/gopac"
license=('MIT')
provides=('gopac')
conflicts=('gopac')
depends=('glibc')
optdepends=('yay: AUR helper' 'paru: AUR helper')
source=("gopac::${url}/releases/download/v${pkgver}/gopac"
        "LICENCE::${url}/releases/download/v${pkgver}/LICENCE"
        "gopac.fish::${url}/releases/download/v${pkgver}/gopac.fish")
sha256sums=('729937a5f29e11a849a69e44abe4bd7c4c726471fce268dd1360711acba64dd0' '7b057371634a495f9b2d47a44d2fcb3c5ac0a9d43034c57c0f7914160eb3954f' '54feeb751e7b2d3295004205cc66b3615713fb33f90fb19e651beb04807c432d')

package() {
  install -Dm755 gopac "$pkgdir/usr/bin/gopac"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm644 gopac.fish "$pkgdir/usr/share/fish/vendor_completions.d/gopac.fish"
}
