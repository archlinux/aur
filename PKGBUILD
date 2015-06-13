# Contributor: Civa lin = 林雪凡 <larina.wf@gmail.com>
# Maintainer: Daniel YC Lin <dlin.tw at gmail>

pkgname=lonote
pkgver=3.2.12
pkgrel=1
pkgdesc="A free/open-source personal note-taking software which help you to editing & browsing your notes in a easy way."
url="https://bitbucket.org/civalin/lonote"
arch=('any')
license=('apache')
makedepends=('')
depends=('python>=3.3.1')
install=$pkgname.install
source=(http://bitbucket.org/civalin/lonote/downloads/lonote-$pkgver.zip)

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root $pkgdir/
    find $pkgdir -iname '*.pyc' -delete
}
md5sums=('5547382bc2d397f6d2cd7b61edaa6b23')
