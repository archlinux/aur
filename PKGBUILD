# Maintainer: Rakosn1cek <rakosn1cek@zohomail.eu>

pkgname=arch-update-check
pkbase=arch-update-check
pkgver=1.3.1
pkgrel=1
pkgdesc="Pre-update safety checks for Arch Linux (Arch News, system state, optional AUR checks)"
arch=('any')
url="https://github.com/Rakosn1cek/arch-update-check"
license=('MIT')
depends=('bash' 'curl' 'pacman' 'systemd')
optdepends=('yay: for optional AUR update checks')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Rakosn1cek/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")


package() {
  install -Dm755 "arch-update-check-${pkgver}/arch-update-check.sh" \
    "$pkgdir/usr/bin/arch-update-check"
  install -Dm644 "arch-update-check-${pkgver}/README-arch-update-check.md" \
    "$pkgdir/usr/share/doc/arch-update-check/README-arch-update-check.md"
}
sha256sums=('88497c4ecc5a15bae24022e7ea6a753b9a30d312739e9baa77391e1ac08deb6a')
