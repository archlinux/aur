# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='eve-ng-integration'
pkgver='0.4.1'
pkgrel='1'
pkgdesc='Integrates EVE-NG (aka UNetLab) with Linux desktop'
arch=('any')
url='https://github.com/SmartFinn/eve-ng-integration'
license=('GPL')
depends=('inetutils' 'vinagre' 'wireshark-qt' 'x11-ssh-askpass')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e3f5fcf5f6e91481d4561df5a483a36bf7f876e08151817b31fa55acfc9a3d67')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
