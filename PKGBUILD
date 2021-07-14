# Maintainer: Toadtoad

pkgname=joindesktop-bin
pkgver=1.1.2
pkgrel=1
pkgdesc='An official desktop app for Join by Joaoapps built in Electron.'
arch=('x86_64')
license=('none')
provides=('joindesktop')
conflicts=('joindesktop')
url='https://joaoapps.com/join/desktop'
source=("https://github.com/joaomgcd/JoinDesktop/releases/download/v${pkgver}/com.joaomgcd.join_${pkgver}_amd64.deb")
sha512sums=('a0f18f1e21947cc15c10e5200b912dc6701f363c4f6abdaabbc5bee7f22510d23520027da29f2f6339a6de9c0c733c887606660085b6c174fcf56b2dafb9b440')

package() {
  cd "${srcdir}"
  tar -xf data.tar.xz -C "${pkgdir}"
  cd "${pkgdir}"
}
