pkgname=gimp-plugin-contrastfix
pkgver=1.0
pkgrel=2
pkgdesc="Adds a Contrast Adjustment layer to your image to help fix contrast problems."
arch=('any')
url="http://registry.gimp.org/node/182"
license=('GPL3')
depends=('gimp')
source=(https://cl.ly/42cc0501c4a9/download/Darla-ContrastFix.scm)
md5sums=('b4a23007c15abe521a0a46ec2f04e515')

package() {
	  cd ${srcdir}
	  install -Dm0644 Darla-ContrastFix.scm \
		"${pkgdir}/usr/share/gimp/2.0/scripts/Darla-ContrastFix.scm"
	} 

