# Maintainer: Toadtoad

pkgname=joindesktop-bin
pkgver=0.5.2
pkgrel=1
pkgdesc='An official desktop app for Join by Joaoapps built in Electron.'
arch=('x86_64')
license=('none')
provides=('joindesktop')
conflicts=('joindesktop')
url='https://joaoapps.com/join/desktop'
source=("https://github.com/joaomgcd/JoinDesktop/releases/download/v${pkgver}/com.joaomgcd.join_${pkgver}_amd64.deb")
sha512sums=('3dbd2d3717cc80a8a9ff8fe46395f34451f95b049e9d81e644bbf464be9f394dd271d9993d0f010f42e70095456f8c4402d4df944dfeeb81bddce03aa8080d34')

package() {
  cd "${srcdir}"
  tar -xf data.tar.xz -C "${pkgdir}"
  cd "${pkgdir}"
}
