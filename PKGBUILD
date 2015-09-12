# Maintainer: Kaan Genç <aur@kaangenc.me>

pkgname=python-redditcurl
_pkgname=redditcurl
pkgver=0.4.0
pkgrel=1
pkgdesc='Download the images you saved on Reddit.'
arch=(any)
url='https://github.com/SeriousBug/redditcurl'
license=('GPL')
source=("https://pypi.python.org/packages/source/r/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('d3af8a9a5c48e1e726643f106d888ff2')
depends=('python'
         'python-beautifulsoup4'
         'python-praw'
         'python-requests')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
