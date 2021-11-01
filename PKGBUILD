# Maintainer: Ryan Algar <ryzer@arch-linux>
# Upstream: TheWaveWarden (Frederik Siepe) <info AT thewavewarden DOT com>

pkgname=odin2-synthesizer-bin
pkgver=2.3.2
_pkgver=2.3-2
pkgrel=1
pkgdesc='24 voice polyphonic synthesizer, with FX rack (Standalone, VST3, LV2). Binary package.'
license=('GPL3')
arch=('x86_64')
url='https://www.thewavewarden.com/odin2'
provides=('odin2')
conflicts=('odin2-synthesizer')

depends=('man-pages' 'ttf-font')
optdepends=('ttf-dejavu: One of these may be needed for fonts to render correctly'
            'ttf-liberation: One of these may be needed for fonts to render correctly')

source=("https://www.thewavewarden.com/assets/Odin2-synth_${_pkgver}.deb")
sha256sums=('d5fb493cf77b80d34cf25b9f2c44b95a0a74e840234571d718372002199b4163')
backup=('opt/odin2/odin2.conf' 'opt/odin2/Soundbanks/User Patches')
install='.install'

package() {
    # Unpack package contents
    bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}
