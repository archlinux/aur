# Maintainer: Funami
pkgname=systemd-stub-x64
pkgver=251.4
pkgrel=1
pkgdesc="A simple UEFI kernel boot stub"
arch=('x86_64')
url="https://www.github.com/systemd/systemd"
license=('GPL2' 'LGPL2.1')
provides=('systemd-stub')
conflicts=('systemd-stub')
source=("https://archive.archlinux.org/packages/s/systemd/systemd-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('aa439ec93a6b7094a50d0cb128c0659ec303539dc3eda4aa51c8bb24a20d499d')

package() {
  install -Dm755 "${srcdir}/usr/lib/systemd/boot/efi/linuxx64.efi.stub" -t "${pkgdir}/usr/lib/systemd/boot/efi/"
}
