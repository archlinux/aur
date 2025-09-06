# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=videotimestamps
pkgname=python-${_plug}
pkgver=0.2.1
pkgrel=1
pkgdesc="Python package: ${_plug}"
arch=('any')
url='https://github.com/moi15moi/VideoTimestamps/'
license=('MIT')
depends=('python')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/60/14/5036f6dc2457a18d61a8affeca607190167a97d71cf35ba89e06fc246475/videotimestamps-0.2.1-py3-none-any.whl")
sha256sums=('40a092bbe7fa26e423097ec9743841e3afd6b94c5e7407043a3aedd6c1880015')

package() {
  python -m installer --destdir="$pkgdir" "${_plug}-${pkgver}-py3-none-any.whl"
}
