# Contributor: nblock <nblock [/at\] archlinux DOT us>

pkgname=python2-instapaperlib
pkgver=0.4.0
pkgrel=1
pkgdesc='Python library for the instapaper.com API'
arch=('any')
url='http://pypi.python.org/pypi/instapaperlib'
license=('GPL')
depends=('python2')
source=(http://pypi.python.org/packages/source/i/instapaperlib/instapaperlib-${pkgver}.tar.gz)
md5sums=('c6f4c0cfeed03a5b417fa07f9e89d35d')

build() {
  cd "instapaperlib-${pkgver}"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
