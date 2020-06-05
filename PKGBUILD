# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=papirus-filezilla-themes
pkgver=20200105
pkgrel=1
pkgdesc="Papirus icon theme for Filezilla"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
license=('MIT')
source=("https://github.com/PapirusDevelopmentTeam/${pkgname}/archive/${pkgver}.tar.gz")
depends=('filezilla')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
sha256sums=('28e28c50b6b500b522f78590ce442e2ed93c5c2bd7a169ee1d31ab588af92427')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
