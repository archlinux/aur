# Maintainer:  zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Original submitter's Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname="faq-bin"
pkgver=0.0.7
pkgrel=2

pkgdesc='More flexible jq. Supports BSON, Bencode, JSON, TOML, XML, YAML'
arch=('x86_64')
url='https://github.com/jzelinskie/faq'
license=('APACHE')

depends=('jq')
provides=("faq")
conflicts=("faq")
options=(strip emptydirs zipman)

source=("https://raw.githubusercontent.com/jzelinskie/faq/main/README.md"
	"faq::https://github.com/jzelinskie/faq/releases/download/${pkgver}/faq-linux-amd64")

b2sums=('23f5d3292034ec771c0864ea295e2e9b3eb66ea7eb3290a985da004171f9ba4fc9ba86454d97c96b6a24be31a22c3bbeb41758752c010130354218a8267ead78'
	'9f949db01d8864599353f96ad000690db212ff568c754b2a706f97d830a56ed22f8b00a68547791160e952616425e7fc72b0e12e2533e84eb9d623a431849fb4')

package() {
	install -Dm755 "faq" "${pkgdir}/usr/bin/faq"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/faq/README.md"
}
