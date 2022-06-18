# Maintainer: Ryan Algar <ryzer@arch-linux>
# Upstream: TheWaveWarden (Frederik Siepe) <info AT thewavewarden DOT com>

pkgname=odin2-synthesizer-bin
pkgver=2.3.3
_pkgver=2.3-3
pkgrel=1
pkgdesc='24 voice polyphonic synthesizer, with FX rack (Standalone, VST3, LV2, CLAP). Binary package.'
license=('GPL3')
arch=('x86_64')
url='https://www.thewavewarden.com/odin2'
provides=('odin2')
conflicts=('odin2-synthesizer')

depends=('man-pages' 'ttf-font')
optdepends=('ttf-dejavu: One of these may be needed for fonts to render correctly'
            'ttf-liberation: One of these may be needed for fonts to render correctly')

source=("https://www.thewavewarden.com/assets/Odin2-synth_${_pkgver}.deb")
sha256sums=('9b34b418edb99c13971f21a4829f900fd2a52a8c700ee42ca8885bf85d8b401f')
backup=('opt/odin2/odin2.conf' 'opt/odin2/Soundbanks/User Patches')
install='.install'

package() {
    # Unpack package contents
    bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}
