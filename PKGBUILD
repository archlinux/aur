# Maintainer: Kaan Genç <aur@kaangenc.me>

pkgname=python-redditcurl
_pkgname=redditcurl
pkgver=1.0.0
pkgrel=2
pkgdesc='Download the images you saved on Reddit.'
arch=(any)
url='https://github.com/SeriousBug/redditcurl'
license=('GPL')
source=("https://pypi.python.org/packages/source/r/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('89d145d47797ce3b91aeefe1133b0a62')
depends=('python'
         'python-beautifulsoup4'
         'python-praw'
         'python-requests')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
