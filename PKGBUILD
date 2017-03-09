# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-html5lint
pkgver=0.3.0
pkgrel=1
pkgdesc='Mozilla HTML5-lint (Python version)'
url='https://github.com/mozilla/html5-lint'
license=('MPL')
arch=('any')


depends=('python')

source=("https://github.com/mozilla/html5-lint/raw/v0.3.0/html5check.py")
sha256sums=('9d11200020bf8b340f1a8261e034053c9347c797bb1ec9cf1363116c3ef81b82')
sha1sums=('7f9aeb259ccc6c9cf7335d5f5999edf9b7bf3604')
md5sums=('4e4147379db4038d4ec310b241a273ef')


package() {
  install -D -m755 "${srcdir}"/html5check.py "${pkgdir}"/usr/bin/html5check.py 
}
