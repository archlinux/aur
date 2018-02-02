pkgbase=('python-emoji')
pkgname=('python-emoji')
_module='emoji'
pkgver='0.4.5'
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/e/emoji/emoji-${pkgver}.tar.gz")
md5sums=('5dce7cf156a4980d38300974af4da628')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
