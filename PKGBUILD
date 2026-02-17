# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
# Co-Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
pkgname=atmos-bin
pkgver=1.206.2
pkgrel=2
pkgdesc='Automated Terraform Management & Orchestration Software (ATMOS)'
arch=(x86_64)
url=https://github.com/cloudposse/atmos
license=('Apache-2.0')
optdepends=('terraform'
            'opentofu')
source=("${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64")
sha512sums=('31851a102d2929e001d6f0f68a436e6c7e6d312879bd34d16025bc31194d159c3960de0f62f7e6de43af37bc80f66a9e70c3ca38a08b69ec9ee6715a411eb7cb')
b2sums=('a3f07ef80008049d79e5cdbad260c21a03518842f3bd981d81404cfe42372e62f5368ce21fac60b34e596d21040637908f63210f83ccb4a5b46bad3d128d4c54')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin/}_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
