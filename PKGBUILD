# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Ning Humbert <galaxy0419@gmail.com>
pkgname=hitwh-cscore
pkgver=1.1
pkgrel=2
pkgdesc="Scores checker for undergraduate students in HITwh"
arch=('i686' 'x86_64')
license=('Apache')
depends=(python python-prettytable python-beautifulsoup4 python-requests python-lxml)
provides=("cscore")
source=('cscore')
md5sums=('e228b7be4b06bfe72f3da47b4178208e')

package() {
	mkdir -p $pkgdir/usr/bin
	cp cscore $pkgdir/usr/bin/
}
