pkgname=simpleorcapluginsystem
pkgver=1.01
pkgrel=1
pkgdesc="SOPS Provides a simple plugin system for orca include plugins"
arch=(any)
license=('GPL3')
url="https://github.com/chrys87/simple-orca-plugin-system"
#source=("https://github.com/chrys87/simple-orca-plugin-system/archive/$pkgver.tar.gz")
source=("https://github.com/chrys87/simple-orca-plugin-system/archive/$pkgver.tar.gz")
depends=('orca' 'yad')
install='simpleorcapluginsystem.install'
provides=('simpleorcapluginsystem')
conflicts=('simpleorcapluginsystem-git')
md5sums=('738f3b24557b208d4591aa9acec2d168')
    
package() {
  cd "${srcdir}//simple-orca-plugin-system-$pkgver"
  mkdir -p "$pkgdir/usr/share/"
  cp -r SOPS "$pkgdir/usr/share/"
}
