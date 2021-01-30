# Maintainer: fuan_k <rrkay at posteo dot net>

pkgname=hsaudiotag3k
pkgver=1.1.3
_suffix=post1
pkgrel=1
pkgdesc="Read metadata (tags) of mp3, mp4, wma, ogg, flac and aiff files"
url="http://pypi.org/project/hsaudiotag3k"
arch=('any')
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/6e/4a/117ded92d098ee203391a5712a54ff87b391e7637029a08e68957e399701/hsaudiotag3k-1.1.3.post1.tar.gz")
md5sums=('5b8b865345e1c19bbe036164dac692b8')

build() {
  cd "$srcdir/$pkgname-$pkgver.${_suffix}"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver.${_suffix}"
  python setup.py install --root="$pkgdir"
}
