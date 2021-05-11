# Maintainer: malacology
# Contributor: malacology

pkgname=dambe
pkgver=7.2.137
pkgrel=1
pkgdesc="New and improved tools for data analysis in molecular biology and evolution"
arch=('any')
url="http://dambe.bio.uottawa.ca/DAMBE/dambe.aspx"
license=('custom')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("http://dambe.bio.uottawa.ca/software_download/DAMBEX.msi")
md5sums=('d91c2e417ae537ab43e7af22cd122c5e')

package() {
  install -dm755 "$pkgdir"/usr/share/applications
  wine msiexec /i "$srcdir"/DAMBEX.msi
}
