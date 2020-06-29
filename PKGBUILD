# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>
pkgname=grub2-theme-preview
pkgver=1.4.4
pkgrel=2
pkgdesc="Preview a full GRUB 2.x theme (or just a background image) using KVM/QEMU"
arch=('any')
url="https://github.com/hartwork/grub2-theme-preview"
license=('GPL')
depends=('grub' 'qemu' 'mtools' 'python' 'python-distro' 'libisoburn' 'edk2-ovmf')
source=("git+https://github.com/hartwork/grub2-theme-preview.git#tag=${pkgver}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/$pkgname"
  make DESTDIR="$pkgdir" install
}
