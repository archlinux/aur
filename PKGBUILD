# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('git-pylint-commit-hook')
pkgver=2.6.1
pkgrel=1
pkgdesc="Git pre-commit hook to check Python code quality with pylint. You can use this hook to prohibit Python code with a bad syntax to be checked in."
arch=('any')
url="https://github.com/sebdah/git-pylint-commit-hook"
license=('Apaches')
depends=("python-future" "python-pylint")
makedepends=('python-setuptools' 'python')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('81a97310fa95f0d1ee22c10de9d22ac34797bfa57cb5b9a0df0c3452cc2c46b6')



package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  python setup.py install --root "$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}