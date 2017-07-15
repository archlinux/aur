# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>
pkgname='pug'
pkgver=1.3
pkgrel=1
pkgdesc='Automatically saves and synchronizes Pacman and AUR installed package lists into Gists.'
arch=('x86_64' 'i686')
license=('GPL')
depends=('pacman' 'gist>=4.5.0')
makedepends=('make' 'git')
url="https://github.com/Ventto/${pkgname}.git"
source=("https://github.com/Ventto/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
