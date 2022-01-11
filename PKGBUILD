# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=python-hypergan
_pkgname=hypergan
pkgver=1.0.6
pkgrel=1
pkgdesc="A customizable generative adversarial network with good defaults. Build your own content generator."
arch=('i686' 'x86_64')
url="https://github.com/255BITS/HyperGAN"
license=('MIT')
depends=('python' 'python-flask' 'python-flask-cors' 'python-hyperchamber' 'python-tensorflow-cuda' 'python-scipy' 'python-pillow')
optdepends=('gperftools: Increase memory performance')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/d8/bd/2e7d2dd8b8239d60c711236e068b1fa713e654a132616fb8d8f515bad857/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c48c6cffdbcb894d6685f15e6a1d754c4dccfde4f897efa93a2bd8576cf6a666')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
