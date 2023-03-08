# Maintainer: p4ck3t0 <aur@p4ck3t0.de>

pkgname=asmcli
pkgver=1.16.2
downloadver=1.16
pkgrel=1
pkgdesc="Anthos Service Mesh command line interface, to install and manage an Anthos Service Mesh."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/GoogleCloudPlatform/anthos-service-mesh-packages'
license=('Apache 2.0')
provides=('asmcli')
depends=('kpt')
sha256sums=('c90e2dc207b7c0646aba3c06a9dbab0122c0358c14b85d7c5e337eed811884d8')

source=("asmcli-${downloadver}"::"https://storage.googleapis.com/csm-artifacts/asm/asmcli_${downloadver}")

package() {
  install -Dm 755 "${srcdir}/asmcli-${downloadver}" "${pkgdir}/usr/bin/asmcli"
}
