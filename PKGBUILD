# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=imgurbash
pkgver=4
pkgrel=1
pkgdesc="A simple bash script to upload an image to imgur from the commandline"
arch=('any')
url="https://imgur.com/tools/"
license=('PD')
depends=('bash' 'curl')
optdepends=('xsel: automatically putting the URL on the X selection for easy pasting'
	'xclip: an alternative to xsel')
source=("https://imgur.com/tools/imgurbash.sh")
sha256sums=('41310047e634c4be5471d0470b7e862b7f27158fdc6afd2fc1a17fbc8b6da79a')

package() {
  install -D -m 755 imgurbash.sh "$pkgdir/usr/bin/imgurbash"
}

# vim:set ts=2 sw=2 et:
