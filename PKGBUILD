# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: David Campbell <davekong@archlinux.us>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Frederik M.J.V. <freqmod VED iskrembilen Dott kom>

pkgname=python-tempita
pkgver=0.5.3dev20170202
_commit=47414a7c6e46a9a9afe78f0bce2ea299fa84d10d
pkgrel=5
pkgdesc="A lightweight unicode templating language"
arch=('any')
url="http://pythonpaste.org/tempita/"
license=('custom:MIT')
depends=('python')
makedepends=('python-distribute' 'git')
#source=(https://pypi.python.org/packages/source/T/Tempita/Tempita-${pkgver}.tar.gz)
source=("$pkgname::git://github.com/gjhiggins/tempita.git#commit=${_commit}")
sha256sums=('SKIP')

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
