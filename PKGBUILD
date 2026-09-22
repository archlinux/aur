# Maintainer: Shakakibara <aryan.1843@disroot.org>

pkgname='monochrome-desktop-bin'
_pkgname='Monochrome.Desktop'
pkgver=2.0.14
pkgrel=1
pkgdesc='Stream and download millions of Hi-Res FLACs, unreleased songs and music videos, all for free on Monochrome.'
arch=('x86_64')
url='https://github.com/monochrome-music/monochrome'
license=('Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator')
options=('!strip')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/monochrome-music/desktop-app/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('24ddb66d2961e07fe997bc6836b7901f9225e2eaf369d4e22e65f72840a78e90')

package() {
      # Extract
      bsdtar -xf data.tar.* -C "$pkgdir/"
}
