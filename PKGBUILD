# Maintainer: Mateusz Galazyn <carbolymer at gmail.com>

pkgname=haskell-fourmolu-static
pkgver=0.20.0.0
pkgrel=1
pkgdesc="Fourmolu is a formatter for Haskell source code. It is a fork of Ormolu, with upstream improvements continually merged."
arch=('x86_64')
url="https://github.com/fourmolu/fourmolu"
license=('Apache')
depends=('sh' 'zlib' 'gmp')
provides=('haskell-fourmolu')
conflicts=('haskell-fourmolu')
source=("https://github.com/fourmolu/fourmolu/releases/download/v${pkgver}/fourmolu-${pkgver}-linux-${arch}.zip")
sha256sums=('c1e290f504087a6fa1a647b9c19546512fee018e465f7ec4842c985ab9e29abc')
options=(!strip)

package() {
  install -Dm755 "fourmolu-${pkgver}-linux-${arch}/fourmolu" "${pkgdir}/usr/bin/fourmolu"
}

