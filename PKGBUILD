# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=quark-electron-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="A cross-platform, integrated development environment for rapidly building - functional , prototypal projects, written in HTML, CSS and JavaScript with native desktop app like capabilities"
arch=('x86_64')
url='https://quarkjs.io'
license=('GPL3')
provides=('quark-electron')
depends=('libxss'
         'gtk3'
         'nss')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nishkalkashyap/Quark-electron/releases/download/v${pkgver}/Quark-linux-amd64-${pkgver}.deb")
sha256sums=('eb28db768d60a913bc25b92a4c23ab2077101101a56373e18f52cce9503ba3b6')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  sed -i 's/IDE;/IDE;Development;/' "${pkgdir}/usr/share/applications/quark.desktop"
}