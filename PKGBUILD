# Maintainer: Kaan Genç <aur@kaangenc.me>

pkgname=python-redditcurl
_pkgname=redditcurl
pkgver=2.0.1
pkgrel=1
pkgdesc='Download the images you saved on Reddit.'
arch=(any)
url='https://github.com/SeriousBug/redditcurl'
license=('GPL')
source=("https://pypi.python.org/packages/source/r/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('c489af3341fdb07d0010aef56325f458')
depends=('python'
         'python-beautifulsoup4'
         'python-praw'
         'python-requests')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
