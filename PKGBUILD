# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=qizxopen
pkgver=4.1
pkgrel=4
pkgdesc="XML indexing and searching engine, fully supporting XQuery"
url="https://github.com/jose1711/qizxopen"
arch=('any')
license=('MPL')
depends=('java-runtime' 'apache-ant' 'bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jose1711/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('999d160180eb7631ddf42b5a38c3df921cb2f331077964f155e4fd72c3eaeb11')

package() {
	# As the tarfile does not contain any installer, the files
	# are copied manually
	cd "${srcdir}/${pkgname}-${pkgver}"
	cp -Rp usr "${pkgdir}"
}
