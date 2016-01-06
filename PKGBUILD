pkgname=simpleorcapluginsystem-git
pkgver=0.1
pkgrel=1
pkgdesc="SOPS Provides a simple plugin system for orca include plugins"
arch=(any)
license=('GPL3')
url=('https://github.com/chrys87/simple-orca-plugin-system')
source=('https://github.com/chrys87/simple-orca-plugin-system.git')
depends=('orca')
makedepends=('git')
install='simpleorcapluginsystem-git.install'
provides=('simpleorcapluginsystem')
conflicts=('simpleorcapluginsystem')
md5sums=('SKIP')
    
package() {
 cd "${srcdir}/simple-orca-plugin-system"
  install -d SOPS "$pkgdir/usr/share/SOPS"
}
