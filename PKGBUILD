# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Your Name <youremail@domain.com>
pkgname=hg-versioninfo
_pkgname="Mercurial Version Info Plugin"
pkgver=1.0.2
pkgrel=2
pkgdesc="Easily record repository version information to a .py file."
arch=('i686' 'x86_64')
url="https://bitbucket.org/dowski/mercurial-version-info-plugin/overview"
license=('GPL')
options=(!emptydirs)
source=(https://bitbucket.org/dowski/mercurial-version-info-plugin/downloads/Mercurial%20Version%20Info%20Plugin-$pkgver.tar.gz)
md5sums=('00ae25047312558945676d16a5248717')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
