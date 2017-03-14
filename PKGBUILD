# Maintainer: Corey Hinshaw <coreyhinshaw@gmail.com>

pkgname=luks-tpm
pkgver=0.2.1
pkgrel=1
pkgdesc="Utility to manage LUKS keyfiles sealed by the TPM"
arch=('any')
url="https://github.com/electrickite/luks-tpm"
license=('GPL')
depends=('tpm-tools' 'trousers' 'cryptsetup' 'coreutils' 'util-linux')
source=('luks-tpm')

sha256sums=('45e4009da6ff8810cb38f4178a23023c0111563d2a500292459c58d6dd5e058c')

package() {
  install -Dm755 luks-tpm "${pkgdir}/usr/bin/luks-tpm"
}
