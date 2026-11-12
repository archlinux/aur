# Maintainer: Shakakibara <aryan.1843@disroot.org>

pkgname='monochrome-desktop-bin'
_pkgname='Monochrome.Desktop'
pkgver=2.0.18
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
sha256sums=('197a71d2c7de49e8a0b01fa1868052083019d475d15cdf1ed8b03fa3f4a77f41')

package() {
      # Extract
      bsdtar -xf data.tar.* -C "$pkgdir/"
}
