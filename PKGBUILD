pkgname=simpleorcapluginsystem-git
pkgver=1.01
pkgrel=1
pkgdesc="SOPS Provides a simple plugin system for orca include plugins"
arch=(any)
license=('GPL3')
url="https://github.com/chrys87/simple-orca-plugin-system"
source=('git+https://github.com/chrys87/simple-orca-plugin-system.git')
depends=('orca' 'yad')
makedepends=('git')
install='simpleorcapluginsystem-git.install'
provides=('simpleorcapluginsystem')
conflicts=('simpleorcapluginsystem')
md5sums=('SKIP')
    
package() {
  cd "${srcdir}/simple-orca-plugin-system"
  mkdir -p "$pkgdir/usr/share/SOPS"
  cp -r * "$pkgdir/usr/share/SOPS"
}
