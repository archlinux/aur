# Maintainer: Umut Dag <me@umtdg.com>

pkgname=quark-quick-access
pkgver=0.2.0
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

install=${pkgname}.install

source=("${url}/releases/download/v${pkgver}/Quark_${pkgver}_amd64.deb")
sha256sums=('34854425267146531104bedc4ec94f1d9b05e21c74e33ffe51251dce6e6bd81f')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}
