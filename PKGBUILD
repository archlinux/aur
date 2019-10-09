# Original Maintainer: mariusn <marius@softpedia.com>
# Previous Maintainer: HanFox <hanfox.co.uk>
# Previous Maintainer: Xyon <admin@jbladen.co.uk>
# Previous Contributor: Doug Newgard <scimmia22@outlook.com>
# Maintainer: mwawrzyniak <mwawrzyniak@cmstactical.net>

pkgname=trillian
pkgver=6.2.0.1
pkgrel=1
pkgdesc="A commercial, multi-protocol and cross-platform IM client"
majorver=6.2
arch=('x86_64')
url="https://www.trillian.im"
license=('Proprietary')

depends=('gtkmm3' 'libzip' 'openssl-1.0' 'webkit2gtk' 'libnotify' 'libpulse' 'libxss' 'librsvg' 'libsecret')
optdepends=('libappindicator-gtk3: tray icon support')
install='trillian.install'
source_x86_64=("https://www.trillian.im/get/linux/${majorver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('f73c785663c8cea1974fb28486813035cd2514290e477a0c69d4e820d2c7ad04')

package() {
  tar xvf "$srcdir/data.tar.xz" -C "$pkgdir/"
}
