# A dummy package, to save disk space.
# The symlink is to prevent "command not found" when installing packages that need a2x + asciidoc
#
# WARNING: Only install this if you know what you are doing & why!
#

pkgname=asciidoc-fake
pkgver=1.0
pkgrel=1
pkgdesc="A fake asciidoc to keep some packages happy, and save disk space"
arch=('any')
url="http://www.methods.co.nz/asciidoc"
license=('GPL')
conflicts=('asciidoc')
provides=('asciidoc')

package() {
	mkdir -p "$pkgdir/usr/bin"
	ln -s /usr/bin/true "$pkgdir/usr/bin/a2x"
	ln -s /usr/bin/true "$pkgdir/usr/bin/asciidoc"
}
