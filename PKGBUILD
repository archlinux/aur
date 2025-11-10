# Maintainer: shanoaice <shanoaice at tutamail dot com>

pkgname=dracut-crypttab-initramfs
pkgver=1
arch=(any)
pkgrel=1
pkgdesc="tiny dracut module to include /etc/crypttab.initramfs in generated files"
url="https://aur.archlinux.org/packages/dracut-crypttab-initramfs"
license=('GPL-3.0-only')
depends=(dracut)
source=("dracut-crypttab-initramfs.sh")
sha256sums=('3c731a01543cfdcb9e9c065c8951da5c11d97d09fbd826ebd674ab3ed0ddaf0b')

package() {
  install -Dm644 dracut-crypttab-initramfs.sh "$pkgdir/usr/lib/dracut/modules.d/70crypttab-initramfs/module-setup.sh"
}
