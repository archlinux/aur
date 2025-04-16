# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: staphon7 <staphon7 at orange dot fr>
pkgname="advene"
pkgver=3.15
pkgrel=1
pkgdesc="Video annotation and hypervideo authoring"
arch=('any')
url="https://www.advene.org"
license=('GPL2')
depends=('frei0r-plugins'
    'gst-editing-services'
    'gst-libav'
    'gst-plugin-opencv'
    'gst-plugins-bad'
    'gst-plugins-good'
    'gst-plugins-ugly'
    'gst-python'
    'gtksourceview3'
    'librsvg'
    'pulse-native-provider'
    'python-cairo'
    'python-cherrypy'
    'python-nltk'
    'python-opencv'
    'python-objgraph'
    'python-pillow'
    'python-rdflib'
    'python-regex'
    'python-requests'
    'python-scipy'
    'python-setuptools'
    'python-simplejson'
    'webkit2gtk')
optdepends=('espeak: TTS support'
    'festival: TTS support'
    'alsa-utils: TTS support - with festival'
    'brltty: Braille support'
    'pocketsphinx: Speech recognition')
provides=('python-simpletal=5.2')
conflicts=('python-simpletal=5.2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oaubert/advene/archive/refs/tags/release/${pkgver}.tar.gz")
sha256sums=('dfdf45268b5cd7aacfe41ddabd7c7d8339b4acda034f8389a1ae2972edc1c61e')

package() {
    cd "$pkgname-release-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
