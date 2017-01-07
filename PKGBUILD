# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-dictobject
pkgver=0.1.3
pkgrel=1
pkgdesc="Python DictObject allows attribute access on dicts."
arch=("any")
url="https://pypi.python.org/pypi/DictObject"
license=("GPL")
depends=("python" "python-luckydonald-utils")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/b9/e2/e967737367e99679cf0edaf7e0b3d22e2f941c09f33481430807ecf754cc/DictObject-0.1.3.tar.gz")
sha256sums=("5990aa7bfa4d2fe1481e43ffd29d2080ce61abe9ff627cfbcbb5e8197041d4a0")

package() {
    cd "DictObject-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
