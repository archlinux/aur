# Maintainer: WhriedPlanck

pkgname=airsend-desktop
pkgver=1.9.78
pkgrel=1
pkgdesc="Simple Communication and Collaboration with clients, team members or anyone to get work done"
arch=('x86_64')
url="https://www.airsend.io/"
license=('custom')
depends=('libxss' 'gtk3' 'nss')
provides=('airsend')
source=("https://patch.codelathe.com/airsend/live/installer/linux/AirSend-Setup.deb")
sha256sums=('905c79ccad7b8f365a922bbe54782245d4c994bed486c4f326cb5032315ad64c')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir"
  cd "${pkgdir}"
  #install -Dm644 "${srcdir}"/LICENSE usr/share/licenses/electron-lark-bin/LICENSE
  #chmod 755 opt/
  #chmod 755 usr/
  #chmod 755 usr/share/
  #chmod 755 usr/share/applications/
}
