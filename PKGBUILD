# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-kodi-voice
pkgname=('python2-kodi-voice')
pkgver=0.9.4
pkgrel=1
pkgdesc="Package to make interfacing with Kodi very easy."
arch=('any')
url='https://github.com/johnwheeler/flask-ask'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/m0ngr31/kodi-voice/archive/${pkgver}.tar.gz")
sha256sums=('35f59804c414b11067edccf91c7d0db32df090c22a49cac3657316d63695b4af')

package_python-kodi-voice() {
  depends=('python-fuzzywuzzy' 'python-requests' 'python-roman')
  pkgdesc="Package to make interfacing with Kodi very easy. (python3 version)"

  cd "${srcdir}/kodi-voice-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

package_python2-kodi-voice() {
  depends=('python2-fuzzywuzzy' 'python2-requests' 'python2-roman' 'python2-num2words')
  pkgdesc="Package to make interfacing with Kodi very easy. (python2 version)"

  cd "${srcdir}/kodi-voice-${pkgver}"
  python2 setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
