# Maintainer: Kaan Genç <SeriousBug at Gmail dot com>

pkgname=python-praw-oauth2util
_pkgname=praw-oauth2util
pkgver=0.3.1
pkgrel=1
pkgdesc='OAuth2 utility for PRAW.'
arch=(any)
url='https://github.com/SmBe19/praw-OAuth2Util'
license=('MIT')
source=("https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.zip")
md5sums=('87b3f1c1b90687c50590feb9c3356873')
depends=('python>=3.3'
         'python-praw>=3.1')


package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
