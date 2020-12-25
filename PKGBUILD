# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='tspreed'
pkgver=1.2.2
pkgrel=2
pkgdesc='Terminal RSVP speed reader with Spritz-like functionality'
arch=('any')
url='https://github.com/n-ivkovic/tspreed'
license=('GPL3')
backup=("etc/${pkgname}/${pkgname}.rc")
source=("${pkgname}-${pkgver}-${pkgrel}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('19361399a870c017d6100e5945e82e64eb20928607f785dcff00e57e5efb3150')

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
