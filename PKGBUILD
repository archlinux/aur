# Maintainer: Umut Dag <me@umtdg.com>

pkgname=quark-quick-access-bin
pkgver=0.2.7
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
sha256sums=('809784e92c64d394090da62cdcef7652acbaa4fa8730870d5d2ae2b503f25b46')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}
