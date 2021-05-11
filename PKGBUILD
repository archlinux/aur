# Maintainer: malacology
# Contributor: malacology

pkgname=paup-gui
pkgver=4.0a
pkgrel=1
pkgdesc="Phylogenetic Analysis Using PAUP"
arch=('any')
url="http://phylosolutions.com/paup-test/"
license=('custom')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("http://phylosolutions.com/paup-test/paup4-setup.msi")
md5sums=('SKIP')

package() {

  wine msiexec /i "$srcdir"/paup4-setup.msi
}
