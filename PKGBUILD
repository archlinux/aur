# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>

pkgname=archlinux-themes-slim
pkgver=1.2
pkgrel=5
pkgdesc="Arch Linux branded themes for the SLiM login manager"
arch=('any')
url="https://www.archlinux.org/"
license=('CCPL:cc-by-sa')
optdepends=('slim: login manager providing theme support')
source=(https://sources.archlinux.org/other/packages/artwork/$pkgname-$pkgver.tar.gz)
sha256sums=('dcbcd85d62ed140f35462290abeeadf773cd763960fb4b8f0e0c6c674da3e813')

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir/usr/share/slim/themes"
  cp -a archlinux-* "$pkgdir/usr/share/slim/themes/"
}

# vim:set ts=2 sw=2 et:
