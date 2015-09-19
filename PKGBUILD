# Maintainer: Kaan Genç <aur@kaangenc.me>

pkgname=python-redditcurl
_pkgname=redditcurl
pkgver=0.4.3
pkgrel=1
pkgdesc='Download the images you saved on Reddit.'
arch=(any)
url='https://github.com/SeriousBug/redditcurl'
license=('GPL')
source=("https://pypi.python.org/packages/source/r/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('56b7acdd4e4e675dcbf76d9b3af1a27b')
depends=('python'
         'python-beautifulsoup4'
         'python-praw'
         'python-requests')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
