# Maintainer: Max Chesterfield <`echo Y2hlc3RtMDA3QGhvdG1haWwuY29tCg== | base64 -d`>


pkgname=python-github-webhook
pkgdesc="A very simple, but powerful, microframework for writing GitHub webhooks in Python"
pkgver=1.0.2
pkgrel=1
arch=('any')
license=('Apache')
depends=('python-flask' 'python-six')
makedepends=('python' 'python-pip')
url="https://github.com/bloomberg/python-github-webhook"
source=("https://github.com/bloomberg/python-github-webhook/archive/${pkgver}.tar.gz")
md5sums=('c7278ff9848aee19be90e46f29344f0f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
} 
