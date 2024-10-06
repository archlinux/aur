# Maintainer:  zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Original submitter's Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname="faq-bin"
pkgver=0.0.7
pkgrel=3

pkgdesc='More flexible jq. Supports BSON, Bencode, JSON, TOML, XML, YAML'
arch=('x86_64')
url='https://github.com/jzelinskie/faq'
license=('APACHE')

depends=('jq')
provides=("faq")
conflicts=("faq")
options=(strip emptydirs zipman)

source=("https://raw.githubusercontent.com/jzelinskie/faq/refs/tags/${pkgver}/README.md"
	"https://github.com/jzelinskie/faq/releases/download/${pkgver}/faq-linux-amd64")

b2sums=('08f8cc9acb54bd713b87f0df0444266f1a33473663dd32b088818cf54cc2f03e5b3fcaa65f22b58c699cecb6a28000992f148ca264b3d797eceaf8b72e91d24f'
	'9f949db01d8864599353f96ad000690db212ff568c754b2a706f97d830a56ed22f8b00a68547791160e952616425e7fc72b0e12e2533e84eb9d623a431849fb4')

package() {
	install -Dm755 "faq-linux-amd64" "${pkgdir}/usr/bin/faq"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/faq/README.md"
}
