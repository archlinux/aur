# Maintainer: Umut Dag <me@umtdg.com>

pkgname=quark-quick-access
pkgver=0.2.5
pkgrel=1
pkgdesc='Quick access application for Proton Pass using pass-cli'
license=('MIT')
arch=('x86_64')
url='https://github.com/umtdg/quark'

depends=(
    'cairo'
    'desktop-file-utils'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup'
    'pango'
    'webkit2gtk-4.1'
    'proton-pass-cli-bin'
)

options=('!strip' '!emptydirs')

source=("${url}/releases/download/v${pkgver}/Quark_${pkgver}_amd64.deb")
sha256sums=('49055b17b3721e6af748ae81a815ff45c9b9058bcf7440aea42452c98fc9d1c5')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}
