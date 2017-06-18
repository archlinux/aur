# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=python-hypergan
_pkgname=hypergan
pkgver=0.8.8
pkgrel=3
pkgdesc="A customizable generative adversarial network with good defaults. Build your own content generator."
arch=('i686' 'x86_64')
url="https://github.com/255BITS/HyperGAN"
license=('MIT')
depends=('python' 'python-flask' 'python-flask-cors' 'python-hyperchamber' 'python-tensorflow-cuda' 'python-scipy' 'python-pillow')
optdepends=('gperftools: Increase memory performance')
options=(!emptydirs)
source=("https://pypi.io/packages/source/h/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c4ba7c509f9fe72d6a99dbe4f2ce409e46aa5f7b6ca464e7c09933d24dca81a4')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
