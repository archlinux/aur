# Maintainer: ItzSelenux <itszariep@outlook.com>

pkgname=picom-9-bin
pkgver=9
pkgrel=1
pkgdesc='X compositor that may fix tearing issues (v9 bin for old hardware)'
arch=('x86_64')
url='https://github.com/yshui/picom'
license=(MIT MPL)
depends=(hicolor-icon-theme libconfig libdbus libev libgl pcre pixman
         xcb-util-image xcb-util-renderutil)
provides=('picom')
noextract=("picom_9-1_amd64.deb")
source=("http://archive.ubuntu.com/ubuntu/pool/universe/p/picom/picom_9-1_amd64.deb")
sha256sums=('ccb8c550c14bd98af423ad79dea096d693f3be40308806c80edc9ad86b61aeec')

package() {
  bsdtar -O -xf "picom_9-1_amd64.deb" data.tar.zst | bsdtar -C "${pkgdir}" -xJf -
  find "${pkgdir}" -type d -exec chmod 755 {} \;
}


