# Maintainer:  zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Original submitter's Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname="faq-bin"
pkgver=0.0.6
pkgrel=2
pkgdesc='More flexible jq. Supports BSON, Bencode, JSON, TOML, XML, YAML'
arch=('x86_64')
url='https://github.com/jzelinskie/faq'
license=('APACHE')
depends=('jq')
provides=("faq")
conflicts=("faq")

source=("faq-${pkgver}-readme::https://github.com/jzelinskie/faq/raw/${pkgver}/README.md")
source_x86_64=("faq-${pkgver}-x86_64::https://github.com/jzelinskie/faq/releases/download/${pkgver}/faq-linux-amd64")

b2sums=('3743f583ae744bc3280be9f9abf13c46b1aaa688115834566f6508f62be83910dc179071c795d3256d3156992da1f9bd492f4874f33c49d856e51c92d42d47c3')
b2sums_x86_64=('b4a47efb2e0da8c9e4b774510b712dd0ab55958676afad49eac52726608b7763fedafc7cf6c4ebb98253d2e3fe3996cc2bffcbaa9a12c2ce656a3b03a996f2a8')

package() {
  install -Dvm755 "faq-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/faq"
  install -Dvm644 "faq-${pkgver}-readme" "${pkgdir}/usr/share/doc/faq/README.md"
}

# vim: ts=2 sw=2 et:
