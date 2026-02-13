# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
pkgname=atmos-bin
pkgver=1.206.0
pkgrel=1
pkgdesc='Automated Terraform Management & Orchestration Software (ATMOS)'
arch=(x86_64)
url=https://github.com/cloudposse/atmos
license=('Apache-2.0')
optdepends=('terraform'
            'opentofu')
source=("${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64")
sha512sums=('7407b7261bc4c099ad3979bb7c66853771f7e5a4da4e0b5022d12e242633257958653f835881cb78514a7024fd71072f8358585bc04806f817b5cfd4e5caf721')
b2sums=('701160e3428b623b95d973d97201b77a529dbf34e7eebb32c66a4314ced8111059517add6e6391acf57ddd09ab02966941db4093cada145e0dea13ad2475da4d')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin/}_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
