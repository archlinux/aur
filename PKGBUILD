# Maintainer: Corey Hinshaw <coreyhinshaw@gmail.com>

pkgname=luks-tpm
pkgver=0.1.0
pkgrel=1
pkgdesc="Utility to manage LUKS keyfiles sealed by the TPM"
arch=('any')
url="https://github.com/electrickite/luks-tpm"
license=('GPL')
depends=('tpm-tools' 'trousers' 'cryptsetup' 'coreutils' 'util-linux')
source=('luks-tpm')

sha256sums=('97c7b2a7f45674e96ec25bd69f48bda7749c59bbf6744608d561f84410634198')

package() {
  install -Dm755 luks-tpm "${pkgdir}/usr/bin/luks-tpm"
}
