pkgname=monit-docker
pkgver=0.0.41
pkgrel=1
pkgdesc='Monitor docker containers resources usage and execute docker commands or inside containers'
arch=('any')
url="https://github.com/decryptus/monit-docker"
license=('GPL3')
depends=(
  'python'
  'python-cryptography'
  'python-bitmath'
  'python-docker'
  'python-mako'
  'python-pyopenssl'
  'python-yaml'
  'python-six'
  'python-sonicprobe'
)
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/m/$pkgname/${pkgname/-/_}-$pkgver-py3-none-any.whl")
md5sums=('ea9a1cadb68e6a14ed77af3ee0d14aba')

package() {
	pip install --root="$pkgdir" --ignore-installed --no-deps "$srcdir/${pkgname/-/_}-$pkgver-py3-none-any.whl"
}
