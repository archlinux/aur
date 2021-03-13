# Maintainer: Toadtoad

pkgname=joindesktop-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='An official desktop app for Join by Joaoapps built in Electron.'
arch=('x86_64')
license=('none')
provides=('joindesktop')
conflicts=('joindesktop' 'joindesktop-git')
url='https://joaoapps.com/join/desktop'
source=("https://github.com/joaomgcd/JoinDesktop/releases/download/v${pkgver}/com.joaomgcd.join_${pkgver}_amd64.deb")
sha512sums=('fcdbb6a68a4388c567ee22185bd8c2fe02f88793f8bd6db94c8790536df32a4e5523b420004ee5d737d069c733f2e8378e5a83240ede0cb8e9b068c6d4fd78be')

package() {
  cd "${srcdir}"
  tar -xf data.tar.xz -C "${pkgdir}"
  cd "${pkgdir}"
}
