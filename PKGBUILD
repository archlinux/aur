# Maintainer: M0Rf30

pkgname=grub-theme-midna
_pkgname=midna
pkgver=1.1
pkgrel=1
pkgdesc="Midna Grub-theme, based on Monochrome-light."
url="http://kaosx.us"
arch=('i686' 'x86_64')
license=('GPL' 'CC-SA')
depends=('grub-common')
install=grub-themes.install
source=("http://kaosx.us/repo/core/$pkgname-$pkgver-$pkgrel-x86_64.pkg.tar.xz")

package() {
  cd "${srcdir}"
  
  cp -dpr --no-preserve=ownership -R usr "${pkgdir}/"
}

md5sums=('227f8e496c9493bd872e5042fde77877')
