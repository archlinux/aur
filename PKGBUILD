# Maintainer: malacology
# Contributor: malacology

pkgname=arlequin
pkgver=3.5.2.2
pkgrel=1
pkgdesc="An Integrated Software for Population Genetics Data Analysis"
arch=('any')
url="http://www.cmpg.unibe.ch/software/arlequin35/"
license=('custom')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("http://www.cmpg.unibe.ch/software/arlequin35/win/WinArl35.zip" "arlequin.desktop" "arlequin.png")
md5sums=('545409c0e59e5be6687b6c7f122e58b4'
         '0973863b9050f2702d6ab443bc276aab'
         '230b156c7c8398218177a31b3db3cb12')

package() {
  install -dm755 "$pkgdir"/usr/share/{arlequin,applications}
  mv "$srcdir"/WinArl35/* "$pkgdir"/usr/share/arlequin
  install -Dm755 ${srcdir}/arlequin.png ${pkgdir}/usr/share/arlequin/arlequin.png
  install -Dm755 ${srcdir}/arlequin.desktop ${pkgdir}/usr/share/applications/arlequin.desktop
}
