pkgbase=('python-lemonsqueezer')
pkgname=('python-lemonsqueezer')
_module='lemonsqueezer'
pkgver='0.1.3'
pkgrel=1
pkgdesc="An fast and lightweight wrapper for lemonbar"
url="https://gitlab.com/michalis_pardalos/lemonsqueezer"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/l/lemonsqueezer/lemonsqueezer-${pkgver}.tar.gz")
md5sums=('c85976b86539d616c521d5e72534ce73')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
