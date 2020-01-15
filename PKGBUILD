# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=jetbrains-mono
pkgver=1.0.0
pkgrel=1
pkgdesc="JetBrains Mono. A typeface for developers."
arch=('any')
url="https://www.jetbrains.com/lp/mono"
source=(https://download.jetbrains.com/fonts/JetBrainsMono-$pkgver.zip)
sha256sums=('82bf0dec956e4ca9afa4da4978fa5de80a75a576b3353d570ccbaabe4e858389')
license=('Apache')
depends=('fontconfig' 'xorg-font-utils')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
}
