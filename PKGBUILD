# Maintainer: Jose Olivio Pedrosa <root at rwx dot ovh>
pkgname=python-ite8291r3-ctl
pkgver=0.3
pyname=ite8291r3-ctl
pkgrel=2
pkgdesc="ite8291r3-ctl is a userspace driver for the ITE 8291 (rev 0.03) RGB keyboard backlight controller."
arch=(any)
url="https://github.com/pobrn/ite8291r3-ctl"
license=(GPL2)
depends=(python  python-pyusb)
makedepends=(python-setuptools)
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${pyname:0:1}/${pyname}/${pyname}-${pkgver}.tar.gz")
sha256sums=('d8645a478c552fde378f5a81fee32e1be6e8987698a8c40e6947234bd5be9532')

package() {
  cd "${srcdir}/${pyname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
