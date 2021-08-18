# Maintainer: staphon7 <staphon7 at orange dot fr>
pkgname="advene"
pkgver=3.13.1
pkgrel=1
pkgdesc="Video annotation and hypervideo authoring"
arch=('any')
url="https://github.com/oaubert/advene"
license=('GPL2')
depends=('frei0r-plugins'
    'gst-editing-services'
    'gst-libav'
    'gst-plugin-opencv'
    'gst-plugins-bad'
    'gst-plugins-ugly'
    'gst-python'
    'gtksourceview3'
    'librsvg'
    'pulseaudio'
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
sha256sums=('fbe98802f1c6dce44b554177855ef354bc4fa04d258486ee8b2aedeb8086d829')

package() {
    cd "$pkgname-release-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
