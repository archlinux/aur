# Maintainer: daonm <https://github.com/the-daonm>
pkgname=gopac-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A warm, beautiful TUI for Arch Linux package management (Binary)"
arch=('x86_64')
url="https://github.com/the-daonm/gopac"
license=('MIT')
provides=('gopac')
conflicts=('gopac')
depends=('glibc')
optdepends=('yay: AUR helper' 'paru: AUR helper')
source=("gopac-${pkgver}::${url}/releases/download/v${pkgver}/gopac"
        "LICENCE-${pkgver}::${url}/releases/download/v${pkgver}/LICENCE"
        "gopac.fish-${pkgver}::${url}/releases/download/v${pkgver}/gopac.fish")
sha256sums=('b89909a97b3406f5b110d081d9fe8affd92f7ee371ba343333a1cfaa418646ac' '7b057371634a495f9b2d47a44d2fcb3c5ac0a9d43034c57c0f7914160eb3954f' '54feeb751e7b2d3295004205cc66b3615713fb33f90fb19e651beb04807c432d')

package() {
  install -Dm755 "gopac-${pkgver}" "$pkgdir/usr/bin/gopac"
  install -Dm644 "LICENCE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm644 "gopac.fish-${pkgver}" "$pkgdir/usr/share/fish/vendor_completions.d/gopac.fish"
}
