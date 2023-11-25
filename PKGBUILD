# Maintainer: Funami
pkgname=systemd-stub-x64
pkgver=254.6
pkgrel=1
pkgdesc="A simple UEFI kernel boot stub"
arch=('x86_64')
url="https://www.github.com/systemd/systemd"
license=('GPL2' 'LGPL2.1')
provides=('systemd-stub')
conflicts=('systemd-stub')
source=("https://archive.archlinux.org/packages/s/systemd/systemd-${pkgver}-2-x86_64.pkg.tar.zst")
sha256sums=('56f3629ea1656b0d55cc40e7d7bcdf4aa4b3e2526d0b2e293eaa1beadee2f229')

package() {
  install -Dm755 "${srcdir}/usr/lib/systemd/boot/efi/linuxx64.efi.stub" -t "${pkgdir}/usr/lib/systemd/boot/efi/"
}
