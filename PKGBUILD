# Maintainer: Cristian <cristian@crstian.me>

_pkgname=pokeget
pkgname=pokeget-git
pkgver=0.1
pkgrel=2
pkgdesc="Pokeget is a bash script you can use to display cool sprites of pokemon in your terminal. "
arch=('any')
url="https://github.com/talwat/pokeget"
license=('MIT')
depends=('bash')
makedepends=('git')
source=("git+https://github.com/talwat/pokeget.git")
sha256sums=('SKIP')

package() {
  cd "${_pkgname}"


  install -Dm755 pokeget "${pkgdir}/usr/bin/pokeget"
  
}
