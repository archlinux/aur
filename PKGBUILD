pkgname=uberwriter
pkgver=15.05.01
pkgrel=1
pkgdesc="A simple Markdown editor that offers a lot of features."
arch=(any)
url="http://uberwriter.wolfvollprecht.de/"
license=('GPL')
depends=('python2-gtkspellcheck' 'python2-gobject' 'ttf-ubuntu-font-family' 'pandoc-bin')
makedepends=('python2-distutils-extra')
install=uberwriter.install

source=("https://github.com/wolfv/uberwriter/archive/master.zip")
md5sums=('SKIP')

package() {
	cd uberwriter-master
	python2 setup.py install --root=${pkgdir}
}