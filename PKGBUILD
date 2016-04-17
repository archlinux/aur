# Maintainer: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: SiD/sidious <miste7@web.de>
# Contributor: Mikhail Felixoid Shiryaev <mr.felixoid gmail.com>

pkgname=slim-theme-burning-arch-git
pkgver=1.0
pkgrel=1
pkgdesc="Slim theme for ArchLinux"
license=('custom')
arch=('any')
url="https://github.com/Felixoid/slim-theme-burning-arch"
depends=('slim')
makedepends=('git')
conflicts=('slim-theme-burning-arch')
install=burning-arch.install
source=("${pkgname}::git+https://github.com/Felixoid/slim-theme-burning-arch.git")
md5sums=('SKIP')

package() {
  cd ${srcdir}/${pkgname}/src/
  
  cp -r usr/ ${pkgdir}/
}
