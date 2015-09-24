pkgname=uberwriter
pkgver=15.05.01
pkgrel=1
pkgdesc="A simple Markdown editor that offers a lot of features."
arch=(any)
url="http://uberwriter.wolfvollprecht.de/"
license=('GPL')
depends=('python-gtkspellcheck' 'python-gobject' 'ttf-ubuntu-font-family' 'pandoc-bin' 'dconf' 'desktop-file-utils' 'gnome-web-photo' 'hicolor-icon-theme' 'morituri' 'passenger' 'python' 'python-cairo' 'python-levenshtein' 'python-pyenchant' 'python-regex' 'texlive-bin' 'yelp')
makedepends=('python-distutils-extra')
install=uberwriter.install

source=("https://github.com/wolfv/uberwriter/archive/master.zip")
md5sums=('SKIP')

package() {
	cd uberwriter-master
	python3 setup.py install --root=${pkgdir}
}