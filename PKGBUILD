# Maintainer: Mateusz Galazyn <carbolymer at gmail.com>

pkgname=haskell-fourmolu-static
pkgver=0.16.2.0
pkgrel=1
pkgdesc="Fourmolu is a formatter for Haskell source code. It is a fork of Ormolu, with upstream improvements continually merged."
arch=('x86_64')
url="https://github.com/fourmolu/fourmolu"
license=('Apache')
depends=('sh' 'zlib' 'gmp')
provides=('haskell-fourmolu')
conflicts=('haskell-fourmolu')
source=("https://github.com/fourmolu/fourmolu/releases/download/v${pkgver}/fourmolu-${pkgver}-linux-${arch}")
sha256sums=('94ef3da6dfc439876ed63b91719b570fbc98e385029d1557c4b93341ad0023e2')
options=(!strip)

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp --dereference "fourmolu-${pkgver}-linux-${arch}" "${pkgdir}/usr/bin/fourmolu"
  chmod +x "${pkgdir}/usr/bin/fourmolu"

}

