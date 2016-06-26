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
sha256sums=('09754d96063c5161a8dc092ae8106ba91bdd9186e1d06ec0d0500bea3fd1c2cc'
            '8e4fc0daabfc2726b1bc613727d01cc25bb9864e72b6395cbe5a8d41b22717ef')

package() {
  install -D -m 644 "${srcdir}"/encrypt_remote_luks_header.hook "${pkgdir}"/usr/lib/initcpio/hooks/encrypt_remote_luks_header
  install -D -m 644 "${srcdir}"/encrypt_remote_luks_header.install "${pkgdir}"/usr/lib/initcpio/install/encrypt_remote_luks_header
}
