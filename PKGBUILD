# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pywerview
_pypiname=pywerview
pkgver=0.4.0
pkgrel=1
pkgdesc="A (partial) Python rewriting of PowerSploit's PowerView."
url="https://github.com/the-useless-one/pywerview"
arch=('any')
license=('GPLv3')
depends=('python' 'impacket' 'python-lxml' 'python-beautifulsoup4')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/the-useless-one/pywerview/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('358bfacabf7f0cabde3c0559bd39b0b11d92ec9e6e59f89bcfa410702cd3e1ff')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
