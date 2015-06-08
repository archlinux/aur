# Maintainer: Maxime Gauduin <alucryd@archlinux.org> 

pkgname=plank-theme-numix
pkgver=0.1
pkgrel=1
pkgdesc='Numix theme for plank'
arch=('any')
url='https://numixproject.org/'
license=('GPL3')
depends=('plank')
source=("https://launchpad.net/~numix/+archive/ppa/+files/numix-plank-theme_0.1~ppa.tar.gz")
sha256sums=('951377d49be903e9257ad72bde18689d3471798e6bc21ea84e1249f0646759ed')

package() {
  cd numix-plank-theme

  install -dm 755 "${pkgdir}"/usr/share/plank/themes
  cp -dr --no-preserve='ownership' Numix "${pkgdir}"/usr/share/plank/themes/
}

# vim: ts=2 sw=2 et:
