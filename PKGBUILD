pkgbase='python-issurge'
pkgname=('python-issurge')
_module='issurge'
_src_folder='issurge-0.4.0'
pkgver=0.4.0
pkgrel=1
pkgdesc="Deal with your client's feedback efficiently by creating a bunch of issues in bulk from a text file."
url="https://github.com/ewen-lbh/issurge"
depends=('python')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/ef/fc/9ae9f11a3d44e1c96196bc9a5b50781c38e8882d07738501f8c29117be0a/issurge-0.4.0.tar.gz")
sha256sums=("6f3e0dd3d1a471d4967c11fce68ce25aa83ea576e930b994ab633843fa691f11")

build() {
    cd "${srcdir}/${_src_folder}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
