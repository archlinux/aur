pkgname=simpleorcapluginsystem
pkgver=1.00
pkgrel=1
pkgdesc="SOPS Provides a simple plugin system for orca include plugins"
arch=(any)
license=('GPL3')
url="https://github.com/chrys87/simple-orca-plugin-system"
source=("http://crivatec.de/page/uploads/Downloads/Accessible%20Tools/$pkgname-$pkgver.tar.xz")
depends=('orca' 'yad')
install='simpleorcapluginsystem.install'
provides=('simpleorcapluginsystem')
conflicts=('simpleorcapluginsystem-git')
md5sums=('a7e85eb43f72fbef8f2161be61e374f3')
    
package() {
  cd "${srcdir}/simple-orca-plugin-system"
  mkdir -p "$pkgdir/usr/share/"
  cp -r SOPS "$pkgdir/usr/share/"
}
