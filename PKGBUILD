# Maintainer: Corey Hinshaw <coreyhinshaw@gmail.com>

pkgname=luks-tpm
pkgver=0.1.1
pkgrel=1
pkgdesc="Utility to manage LUKS keyfiles sealed by the TPM"
arch=('any')
url="https://github.com/electrickite/luks-tpm"
license=('GPL')
depends=('tpm-tools' 'trousers' 'cryptsetup' 'coreutils' 'util-linux')
source=('luks-tpm')

sha256sums=('4d360ae7ec695ff3c8bf720971173c89a13625bbb34fa46e1ada85dee2bb1fb2')

package() {
  install -Dm755 luks-tpm "${pkgdir}/usr/bin/luks-tpm"
}
