# Maintainer: Rakosn1cek <rakosn1cek@zohomail.eu>

pkgname=arch-update-check
pkbase=arch-update-check
pkgver=1.4.1
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
  install -Dm644 "arch-update-check-${pkgver}/README.md" \
    "$pkgdir/usr/share/doc/arch-update-check/README.md"
}
sha256sums=('799e69aedf5a4ab450ad6a2c41078db08195d06a041ec58405b21a255bef1c6f')
