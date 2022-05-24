# Maintainer: p4ck3t0 <aur@p4ck3t0.de>

pkgname=asmcli
pkgver=1.13
pkgrel=1
pkgdesc="Anthos Service Mesh command line interface, to install and manage an Anthos Service Mesh."
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/GoogleCloudPlatform/anthos-service-mesh-packages'
license=('Apache 2.0')
provides=('asmcli')
sha256sums=('c55d35a814b3d38208282ddc6e93f9c47babb0b8dbb0c356461d511cf7e89571')

source=("asmcli-${pkgver}"::"https://storage.googleapis.com/csm-artifacts/asm/asmcli_${pkgver}")

package() {
  install -Dm 755 "${srcdir}/asmcli-${pkgver}" "${pkgdir}/usr/bin/asmcli"
}
