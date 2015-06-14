# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=imgurbash
pkgver=4
pkgrel=1
pkgdesc="A simple bash script to upload an image to imgur from the commandline"
arch=("any")
license=('PD')
url="http://imgur.com/tools/"
depends=('bash' 'curl')
optdepends=('xsel: automatically putting the URL on the X selection for easy pasting'
	'xclip: an alternative to xsel')
source=("http://imgur.com/tools/imgurbash.sh")
sha1sums=('a7664f885e7feddab0f3a663d6ee12956367e988')

package() {
	mkdir -p $pkgdir/usr/bin
	install imgurbash.sh $pkgdir/usr/bin/imgurbash -m 755 || return 1
}
