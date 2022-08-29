# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='eve-ng-integration'
pkgver='0.6.0'
pkgrel='1'
pkgdesc='Integrates EVE-NG (aka UNetLab) with Linux desktop'
arch=('any')
url="https://github.com/SmartFinn/${pkgname}"
license=('GPL')
depends=('inetutils' 'vinagre' 'wireshark-qt' 'x11-ssh-askpass')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9631ac8aaf2594ac748b5ff4b728116810416a44eb44adaa1cbb6f8b9f0a47fc')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
