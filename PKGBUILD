# Maintainer: Umut Dag <me@umtdg.com>

pkgname=quark-quick-access
pkgver=0.1.2
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

source=("${url}/releases/download/v${pkgver}/quark_${pkgver}_amd64.deb")
sha256sums=('03f83c01b78f03304ab59e304479d4044feb9832378e565487607dc02e623dd3')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}
