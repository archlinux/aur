# Contributor: staphon7 <staphon7 at orange dot fr>
pkgname="advene"
pkgver=3.14
pkgrel=2
pkgdesc="Video annotation and hypervideo authoring"
arch=('any')
url="https://github.com/oaubert/advene"
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
sha256sums=('6104d68d3f07623c931ae1b887668cd36e7e6d9343dcc9c404cf21de9c884754')

package() {
    cd "$pkgname-release-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
