# Maintainer: Umut Dag <me@umtdg.com>

pkgname=quark-quick-access
pkgver=0.2.4
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
sha256sums=('cd1db9b183a944d253a9e1c497007099b580d98946c5959227b9ca1c56f02123')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}
