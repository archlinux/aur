# Maintainer: Shakakibara <aryan.1843@disroot.org>

pkgname='monochrome-desktop-bin'
_pkgname='Monochrome.Desktop'
pkgver=2.0.19
pkgrel=1
pkgdesc='Stream and download millions of Hi-Res FLACs, all for free on Monochrome.'
arch=('x86_64')
url='https://github.com/monochrome-music/monochrome'
license=('Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator')
options=('!strip')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/monochrome-music/desktop-app/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('97a52ae7719ed6135754e589aef2da16393b6a020a9b6927e3b1f4f6ea829b96')

package() {
      # Extract
      bsdtar -xf data.tar.* -C "$pkgdir/"
}
