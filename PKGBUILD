pkgname='python-aiorpcx'
pkgver=0.5.5
pkgrel=1
pkgdesc="A generic asyncio library implementation of RPC suitable for an application that is a client, server or both."
url="https://github.com/kyuupichan/aiorpcX/"
arch=('any')
license=('MIT')
depends=('python>=3.6')
makedepends=('python' 'python-setuptools')
source=("https://github.com/kyuupichan/${_project_name}/archive/${pkgver}.tar.gz")

package() {
  cd "${srcdir}/aiorpcX-${pkgver}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}

sha256sums=('292db7141b146365e1177925bbb73ea8061be4070b84f1ebea7ecad70d7dd778')
