# Author: Emil Lundberg <lundberg.emil@gmail.com>

pkgname=initcpio-encrypt-remote-luks-header
pkgver=1.0.0
pkgrel=1
pkgdesc="Modified initcpio encrypt hook capable of using remote LUKS header"
arch=('any')
license=('GPL')
source=(
  encrypt_remote_luks_header.hook
  encrypt_remote_luks_header.install
)
sha256sums=('4406f8dc83f4f1b408e49d557515f721d91b358355c71fbe51f74ab27e5c84ff'
            'cfe465bdad3d958bb2332a05e04f2e1e884422a5714dfd1a0a3b9b74bf7dc6ae')

package() {
  install -D -m 644 "${srcdir}"/encrypt_remote_luks_header.hook "${pkgdir}"/usr/lib/initcpio/hooks/encrypt_remote_luks_header
  install -D -m 644 "${srcdir}"/encrypt_remote_luks_header.install "${pkgdir}"/usr/lib/initcpio/install/encrypt_remote_luks_header
}
