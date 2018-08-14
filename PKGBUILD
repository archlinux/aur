# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='eve-ng-integration'
pkgver='0.5.0'
pkgrel='1'
pkgdesc='Integrates EVE-NG (aka UNetLab) with Linux desktop'
arch=('any')
url='https://github.com/SmartFinn/eve-ng-integration'
license=('GPL')
depends=('inetutils' 'vinagre' 'wireshark-qt' 'x11-ssh-askpass')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('739bd4d00df3a01e90824c50d030292b3afb49e263ea5eaa1934bacbc13a9844')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
