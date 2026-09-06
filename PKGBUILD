# Maintainer: Umut Dag <me@umtdg.com>

pkgname=quark-quick-access-bin
pkgver=0.2.8
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
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
    'proton-pass-cli-bin'
)

options=('!strip' '!emptydirs')

source=("${url}/releases/download/v${pkgver}/Quark_${pkgver}_amd64.deb")
sha256sums=('ba16d5698e535a9cbd0af033b6ef2c90f58a8cec11426b4d22f0226d6c497323')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}
