# Maintainer: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: SiD/sidious <miste7@web.de>

pkgname=slim-theme-burning-arch
pkgver=1.0
pkgrel=3
pkgdesc="Slim theme for ArchLinux"
license=('custom')
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/slimburningarch/"
depends=('slim')
install=burning-arch.install
source=("http://sourceforge.net/projects/slimburningarch/files/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('2c7444637b2ad05ac28470ea0419b3a1')

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  
  install -m 644 -D background.png "${pkgdir}"/usr/share/slim/themes/burning-arch/background.png
  install -m 644 -D panel.png "${pkgdir}"/usr/share/slim/themes/burning-arch/panel.png
  install -m 644 -D slim.theme "${pkgdir}"/usr/share/slim/themes/burning-arch/slim.theme

  install -m 644 -D LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
