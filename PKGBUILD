# Maintainer: Corey Hinshaw <coreyhinshaw@gmail.com>

pkgname=luks-tpm
pkgver=0.2.0
pkgrel=1
pkgdesc="Utility to manage LUKS keyfiles sealed by the TPM"
arch=('any')
url="https://github.com/electrickite/luks-tpm"
license=('GPL')
depends=('tpm-tools' 'trousers' 'cryptsetup' 'coreutils' 'util-linux')
source=('luks-tpm')

sha256sums=('c3e1369c91aac6d5bcf6efd1d9b506abd2cf6ddf35da1381887649206b51eef8')

package() {
  install -Dm755 luks-tpm "${pkgdir}/usr/bin/luks-tpm"
}
