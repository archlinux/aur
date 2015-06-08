# Maintainer: ShadowKyogre <shadowkyogre dot public at gmail dot com>

pkgname=slickpicker-git
_githubuser=ShadowKyogre
_gitname="slickpicker"
pkgver=20131118
pkgrel=1
pkgdesc="A small PyQt color picker widget (can be run on its own)"
arch=('any')
url="https://github.com/${_githubuser}/${_gitname}"
license=('GPL')
makedepends=('git')
depends=('python' 'pyqt')
source=("git://github.com/${_githubuser}/${_gitname}.git")
md5sums=('SKIP')

package(){
	cd "$srcdir/$_gitname"
	python setup.py install --root="$pkgdir"
}
