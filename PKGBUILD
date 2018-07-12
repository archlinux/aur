# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

_commit='7f9458299f42e3c558f00e77cf9d3aa9dd857457'
pkgname=python-send-cli
pkgver=2018.04.08
pkgrel=1
pkgdesc='Unofficial command line for Firefox Send'
arch=('any')
url='https://github.com/ehuggett/send-cli'
license=('GPL3')
depends=('python-beautifulsoup4' 'python-pycryptodomex'
         'python-requests-toolbelt' 'python-tqdm')
makedepends=('python-setuptools')
source=("https://github.com/ehuggett/send-cli/archive/${_commit}.tar.gz")
sha256sums=('d6dd7102adba2e8ce5301c636768eb699859b7b70b7187ec0aa48e2868ad38ec')

package() {
  cd send-cli-${_commit}

  python setup.py install --root="${pkgdir}" --optimize='1'
}
