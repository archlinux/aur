# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# AUR Maintainer: Swift Geek

pkgname=python-mdx-video
_pipname=mdx_video
pkgver=0.1.8
pkgrel=4
pkgdesc="Python-Markdown extension for easy video embedding"
arch=('any')
url="https://pypi.python.org/pypi/mdx_video"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/m/${_pipname}/${_pipname}-${pkgver}.tar.gz")
md5sums=('a7c557bc24d0a3fb0a6e138b049d86e8')

package() {
  cd "$srcdir/$_pipname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
