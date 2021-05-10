# Maintainer: malacology
# Contributor: malacology

pkgname=rasp
pkgver=4.2
pkgrel=1
pkgdesc="Reconstruct Ancestral State in Phylogenies is a tool for inferring ancestral state"
arch=('x86_64')
url="http://mnh.scu.edu.cn/soft/blog/rasp/"
license=('GPL3')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("http://mnh.scu.edu.cn/soft/blog/rasp/RASP_Win_20210121.zip" "rasp.desktop" "rasp.png")
md5sums=('4f537c9c2dbe2e555fbdc311f32117e0'
         '4304aead6dcffd521664dbc186997ec8'
         '5b403896e05a3da471be404bb9afe053')

package() {
  install -dm755 "$pkgdir"/usr/{bin,share/{rasp,applications}}
  mv "$srcdir"/RASP_Win/* "$pkgdir"/usr/share/rasp
  install "$srcdir"/rasp.desktop "$pkgdir"/usr/share/applications/rasp.desktop 
  install "$srcdir"/rasp.png "$pkgdir"/usr/share/rasp/rasp.png
}
