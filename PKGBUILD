# Original Maintainer: mariusn <marius@softpedia.com>
# Previous Maintainer: HanFox <hanfox.co.uk>
# Maintainer: Xyon <admin@jbladen.co.uk>
# Contributor: Doug Newgard <scimmia22@outlook.com>

pkgname=trillian
pkgver=6.1.0.4
pkgrel=1
pkgdesc="A commercial, multi-protocol and cross-platform IM client"
majorver=6.1
arch=('x86_64')
url="https://www.trillian.im"
license=('Proprietary')

depends=('gtkmm3' 'libzip' 'openssl-1.0' 'webkitgtk' 'libnotify' 'libpulse' 'libxss' 'librsvg')
optdepends=('libappindicator-gtk3: tray icon support')
install='trillian.install'
source_x86_64=("https://www.trillian.im/get/linux/${majorver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('40a0fa1be794367034fec0f7ac14c3e057029aa1160948994e14747808a0e653')

package() {
  tar xvf "$srcdir/data.tar.xz" -C "$pkgdir/"
}
