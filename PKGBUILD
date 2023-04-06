# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# AUR Maintainer: Swift Geek

pkgname=python-mdx-video
_pipname=mdx_video
pkgver=0.1.8
pkgrel=8
pkgdesc="Python-Markdown extension for easy video embedding"
arch=('any')
url="https://pypi.python.org/pypi/mdx_video"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/m/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('17d8d10d43e42f18456e3d8422ec73b54b2efb307d62021c414bd7cbec59d987')

package() {
  cd "$srcdir/$_pipname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
