# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>

pkgname=openteacher
pkgver=3.3
pkgrel=1
pkgdesc='learning aid a variety of subjects'
url='http://openteacher.org'
license=(GPL3)
arch=('any')


depends=('desktop-file-utils' 'espeak' 'hicolor-icon-theme' 'python2-chardet'
	'python2-docutils' 'python2-opengl' 'python2-pillow' 'python2-pyenchant'
	'python2-pyqt5' 'python2-urwid' 'qt5-declarative' 'qt5-multimedia'
	'qt5-webkit' 'tesseract' 'xdg-utils')

source=("https://sourceforge.net/projects/openteacher/files/openteacher/$pkgver/openteacher_${pkgver}_linux.tar.gz")


sha256sums=('030c3839e9ce6be2c8b21c125b7acd6d91a6737bec96b0fb95839251f2f940dd')


package() {
      python2 setup.py install --root="$pkgdir" --optimize=1
      }
