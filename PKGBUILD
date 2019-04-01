pkgname='pacaur'
pkgver=4.8.6
pkgrel=1
pkgdesc='An AUR helper that minimizes user interaction'
arch=('any')
url="https://github.com/E5ten/${pkgname}"
license=('ISC')
depends=('auracle-git' 'expac' 'sudo' 'git' 'jq')
makedepends=('perl' 'git')
backup=("etc/xdg/${pkgname}/config")
source=("git+${url}#tag=${pkgver}")
sha256sums=('SKIP')

package() {
    make -C "${srcdir}/${pkgname}" DESTDIR="${pkgdir}" PREFIX='/usr' install
}

