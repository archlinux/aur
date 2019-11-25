
pkgname=python-voicerss-tts
pkgver=1.0.6
pkgrel=1
pkgdesc="Access the http://www.voicerss.org/api/ Text to Voice API."
url="https://bitbucket.org/daycoder/voicerss_tts.git"
depends=(python-pip python-logging-helper python-fdutil python-cachingutil)
makedepends=(python-setuptools)
license=('MIT')
arch=('any')
source=("https://pypi.io/packages/source/v/voicerss_tts/voicerss_tts-${pkgver}.tar.gz")
md5sums=('edc60d36861eda79c7a0bc9b4c91b599')

build() {
    cd $srcdir/voicerss_tts-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/voicerss_tts-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
