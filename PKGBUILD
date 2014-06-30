# Maintainer: Eric Bélanger <eric@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>

pkgname=archlinux-themes-slim
pkgver=1.2
pkgrel=4
pkgdesc="Arch Linux branded themes for the SLiM login manager"
arch=('any')
url="http://www.archlinux.org/"
license=('CCPL:cc-by-sa')
optdepends=('slim: login manager providing theme support')
source=(ftp://ftp.archlinux.org/other/packages/artwork/${pkgname}-${pkgver}.tar.gz)
md5sums=('f9b7c231ec26c93fc89ecadfa2d0e250')

package() {
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}/usr/share/slim/themes"
  cp -a archlinux-*/ "${pkgdir}/usr/share/slim/themes"
}
