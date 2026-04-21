# Maintainer: Umut Dag <me@umtdg.com>

pkgname=quark-quick-access-bin
pkgver=0.2.6
pkgrel=1
pkgdesc='Quick access application for Proton Pass using pass-cli'
arch=('x86_64')
url='https://github.com/umtdg/quark'
license=('MIT')

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
sha256sums=('fbf8f493f5f5d7bb0dc1b7e92659fec8315971b898cde2b492a24c94e54e5226')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}
