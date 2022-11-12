# Maintainer: p4ck3t0 <aur@p4ck3t0.de>

pkgname=asmcli
pkgver=1.15.3
downloadver=1.15
pkgrel=1
pkgdesc="Anthos Service Mesh command line interface, to install and manage an Anthos Service Mesh."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/GoogleCloudPlatform/anthos-service-mesh-packages'
license=('Apache 2.0')
provides=('asmcli')
depends=('kpt')
sha256sums=('50ea16cb1fc23f0eae69a524633fdff53092ca3c513aeebf529ca25ae6675222')

source=("asmcli-${downloadver}"::"https://storage.googleapis.com/csm-artifacts/asm/asmcli_${downloadver}")

package() {
  install -Dm 755 "${srcdir}/asmcli-${downloadver}" "${pkgdir}/usr/bin/asmcli"
}
