# A dummy package, to save disk space.
# The symlink is to prevent "error: command failed" when installing packages with info files
#
# WARNING: Only install this if you know what you are doing & why!
#

pkgname=texinfo-fake
pkgver=1.2
pkgrel=1
pkgdesc="A fake texinfo to keep some packages happy, and save disk space"
arch=('any')
url="http://www.gnu.org/software/texinfo/"
license=('GPL3')
conflicts=('texinfo')
provides=('texinfo')

package() {
	mkdir -p "$pkgdir/usr/bin"
	ln -s /usr/bin/true "$pkgdir/usr/bin/install-info"
}
