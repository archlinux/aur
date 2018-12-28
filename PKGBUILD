# Original Maintainer: mariusn <marius@softpedia.com>
# Previous Maintainer: HanFox <hanfox.co.uk>
# Previous Maintainer: Xyon <admin@jbladen.co.uk>
# Previous Contributor: Doug Newgard <scimmia22@outlook.com>
# Maintainer: mwawrzyniak <mwawrzyniak@cmstactical.net>

pkgname=trillian
pkgver=6.1.0.5
pkgrel=1
pkgdesc="A commercial, multi-protocol and cross-platform IM client"
majorver=6.1
arch=('x86_64')
url="https://www.trillian.im"
license=('Proprietary')

depends=('gtkmm3' 'libzip' 'openssl-1.0' 'webkit2gtk' 'libnotify' 'libpulse' 'libxss' 'librsvg')
optdepends=('libappindicator-gtk3: tray icon support')
install='trillian.install'
source_x86_64=("https://www.trillian.im/get/linux/${majorver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('4758bf1a1dea06730dbc2c6952cad22ecd1a2ed722a030a2cd1e6584b9e97d42')

package() {
  tar xvf "$srcdir/data.tar.xz" -C "$pkgdir/"
}
