# maintainer: Colin Wallace <colin@mooooo.ooo>
_name=escpos
pkgname='python-escpos'
pkgver=2.2.0
pkgrel=1
pkgdesc='Python ESC/POS is a library which lets the user have access to all those printers handled by ESC/POS commands, as defined by Epson, from a Python application.'
arch=('any')
url='https://pypi.python.org/pypi/python-escpos'
license=('GPL3')
depends=('python' 'python-pyusb' 'python-pyserial' 'python-pillow' 'python-qrcode')
makedepends=('python' 'python-setuptools')
source=('https://files.pythonhosted.org/packages/24/20/ccfbb4cb44c80e0f2157094dee46b812555d8623a65555dd9466ccc63779/python-escpos-2.2.0.tar.gz')
sha256sums=('ce6196675b7a9846a67bae7776977697f503dae81030f1c530c1f4ff7f529837')

build(){
  cd "${srcdir}"/"python-escpos-2.2.0"
  python setup.py build
}

package() {
  cd "python-escpos-2.2.0"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

