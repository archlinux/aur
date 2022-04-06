# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-kodi-voice
pkgver=1.1.2
pkgrel=2
pkgdesc="Package to make interfacing with Kodi very easy."
arch=('any')
url='https://github.com/m0ngr31/kodi-voice'
license=('MIT')
depends=('python-fuzzywuzzy' 'python-requests' 'python-roman' 'python-req')
makedepends=('python-setuptools')
source=("https://github.com/m0ngr31/kodi-voice/archive/v${pkgver}.tar.gz")
sha256sums=('c2db0f3a646ab6f7fe710547f2c7f1de9bf5d2da29585e2241464869a5b5ddc9')

package() {
  cd "${srcdir}/kodi-voice-${pkgver}"

  python setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
