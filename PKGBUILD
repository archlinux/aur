# Maintainer: Eric Bélanger <eric@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>

pkgname=archlinux-themes-slim
pkgver=1.2
pkgrel=5
pkgdesc="Arch Linux branded themes for the SLiM login manager"
arch=('any')
url="http://www.archlinux.org/"
license=('CCPL:cc-by-sa')
optdepends=('slim: login manager providing theme support')
source=(https://sources.archlinux.org/other/packages/artwork/${pkgname}-${pkgver}.tar.gz)
sha512sums=('b9cdeffadec021ef9f8ec7e315c0618b37aa46501a552b357e460df5664d57bb98971fa3f0a4d7419bbd95051f984ae0bc1d77442478477e39f7cdcfaba67a4b')

package() {
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}/usr/share/slim/themes"
  cp -a archlinux-*/ "${pkgdir}/usr/share/slim/themes"
}
