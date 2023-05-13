# Maintainer: Nathan Doyle <natetronn <at> Gmail-DOT-Com>
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>
pkgname=grub2-theme-preview
pkgver=2.8.0
pkgrel=1
pkgdesc="Preview a full GRUB 2.x theme (or just a background image) using KVM/QEMU"
arch=('any')
url="https://github.com/hartwork/grub2-theme-preview"
license=('GPL')
depends=('grub' 'qemu' 'mtools' 'python' 'python-setuptools' 'libisoburn' 'edk2-ovmf')
makedepends=('git')
source=("git+https://github.com/hartwork/grub2-theme-preview.git#tag=${pkgver}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/$pkgname"
  make DESTDIR="$pkgdir" install
}
