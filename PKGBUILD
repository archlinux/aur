# Maintainer: ItzSelenux <itszariep@outlook.com>

pkgname=wbar-bin
pkgver=2.3.4
pkgrel=1
pkgdesc='light and fast launch bar'
arch=('x86_64')
url='https://github.com/rodolf0/wbar'
license=('unknown')
depends=('imlib2' 'libx11')
noextract=("wbar_2.3.4-10_amd64.deb")
source=("http://ftp.de.debian.org/debian/pool/main/w/wbar/wbar_2.3.4-10_amd64.deb")
sha256sums=('3389627f3511a1f8ab2b25016f00aa1ee6882c4e4eccdf53f094084360b201ba')

package() {
  bsdtar -O -xf "wbar_2.3.4-10_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
  find "${pkgdir}" -type d -exec chmod 755 {} \;
}
