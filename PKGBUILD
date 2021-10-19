# Maintainer: Rasmus Moorats <xx@nns.ee>
pkgname=opensc-gnutls-compat
pkgver=1.0.0
pkgrel=1
pkgdesc='OpenSC configuration for GnuTLS PKCS #11'
url='https://github.com/OpenSC/OpenSC'
arch=('any')
license=('Unlicense')
source=('opensc.module')
depends=('opensc' 'gnutls')
provides=('opensc-gnutls-compat')
sha256sums=('fea71e2e2c1853bba034106d4eb40646a787ed900fef883e09d38dcb29675db4')

package() {
  cd "$srcdir/"

  install -Dm644 opensc.module "${pkgdir}/etc/pkcs11/modules/opensc.module"
}
