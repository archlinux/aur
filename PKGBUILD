# Maintainer: Andre Kugland <kugland@gmail.com>

pkgname="python-webrtcvad"
_pkgname="webrtcvad"
pkgver=2.0.10
pkgrel=1
pkgdesc='Python interface to the Google WebRTC Voice Activity Detector (VAD)'
arch=('any')
url="https://pypi.org/project/$_pkgname/$pkgver"
license=('MIT')
provides=('python-webrtcvad')
source=("https://files.pythonhosted.org/packages/89/34/e2de2d97f3288512b9ea56f92e7452f8207eb5a0096500badf9dfd48f5e6/$_pkgname-$pkgver.tar.gz")
sha256sums=('f1bed2fb25b63fb7b1a55d64090c993c9c9167b28485ae0bcdd81cf6ede96aea')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
