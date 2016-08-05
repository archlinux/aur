pkgbase=('python-dirlog')
pkgname=('python-dirlog')
_module='dirlog'
pkgver='0.2.8'
pkgrel=1
pkgdesc="keep a log of directories you visit to get back fast"
url="https://github.com/ninjaaron/dirlog"
depends=('python')
makedepends=('python-pip')
license=('unknown')
arch=('any')
source=("https://pypi.python.org/packages/40/2f/c45b30ea45aa1b000e71b159fa06b9bfc50996f3d5971322ad18993bf078/dirlog-0.2.8-py3-none-any.whl")
md5sums=('113d03a0c4b95239ae067c0268f070d2')

package() {
    depends+=()
    cd "${srcdir}"
    pip3 install --upgrade --root="${pkgdir}" "dirlog-0.2.8-py3-none-any.whl"
}

