# Maintainer: Toadtoad

pkgname=joindesktop-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='An official desktop app for Join by Joaoapps built in Electron.'
arch=('x86_64')
license=('none')
provides=('joindesktop')
conflicts=('joindesktop')
url='https://joaoapps.com/join/desktop'
source=("https://github.com/joaomgcd/JoinDesktop/releases/download/v${pkgver}/com.joaomgcd.join_${pkgver}_amd64.deb")
sha512sums=('f98ab6ee18ba0b0bb5721a24a5dcc33aacd7e9676e551557b7a312ded1c06b390c8426ec9b2d5bf04f844336bc84716effb5acf64cb05da064d4b377a3a5c312')

package() {
  cd "${srcdir}"
  tar -xf data.tar.xz -C "${pkgdir}"
  cd "${pkgdir}"
}
