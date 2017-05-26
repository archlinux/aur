# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>
pkgname='pug'
pkgver=1.1.4
pkgrel=1
pkgdesc='Automatically saves and synchronizes Pacman and AUR installed package lists into Gists.'
arch=('x86_64' 'i686')
license=('GPL')
depends=('pacman>=5.0' 'pacaur>=4.0.0' 'gist>=4.5.0')
makedepends=('make' 'git')
url="https://github.com/Ventto/${pkgname}.git"
source=("https://github.com/Ventto/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
