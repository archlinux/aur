# Maintainer: Rasmus Moorats <xx@nns.ee>
pkgname=ykcs11-p11-kit-module
pkgver=1.0.0
pkgrel=1
pkgdesc='YubiKey PKCS#11 module configuration for p11-kit'
url='https://developers.yubico.com/yubico-piv-tool/YKCS11/'
arch=('any')
license=('Unlicense')
source=('ykcs11.module')
depends=('yubico-piv-tool' 'libp11-kit')
provides=('ykcs11-p11-kit-module')
sha256sums=('576ad503a06f0d99e4dee211cc565b86e223bf1bc351df7b0ece503674a24ad6')

package() {
  cd "$srcdir/"

  install -Dm644 ykcs11.module "${pkgdir}/usr/share/p11-kit/modules/ykcs11.module"
}
