# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>
pkgname=gimp-plugin-contrastfix
pkgver=1.0
pkgrel=1
pkgdesc="Adds a Contrast Adjustment layer to your image to help fix contrast problems."
arch=('any')
url="http://registry.gimp.org/node/182"
license=('GPL3')
depends=('gimp')
source=(http://registry.gimp.org/files/Darla-ContrastFix.scm)
md5sums=('b4a23007c15abe521a0a46ec2f04e515')

package() {
	  cd ${srcdir}
	  install -Dm0644 Darla-ContrastFix.scm \
		"${pkgdir}/usr/share/gimp/2.0/scripts/Darla-ContrastFix.scm"
	} 

