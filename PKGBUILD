# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=py3status-github-notifications
pkgdesc="Python module for py3status to keep track of your Github notifications."
pkgver=0.1.0
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status' 'python-pygithub' 'awesome-terminal-fonts')
makedepends=('python-setuptools')
url="https://github.com/mcgillij/py3status-github-notifications"
source=("https://github.com/mcgillij/py3status-github-notifications/releases/download/0.1.0/py3status-github-notifications-0.1.0.tar.gz")
md5sums=('ee0630a9c072ec3b47f4a81e7e82d8c5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
} 
