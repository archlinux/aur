# Maintainer: Dominic Egginton <dominic.egginton@gmail.com>
pkgname=flip-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Flip coins in your command line"
arch=("x86_64")
url="https://github.com/dominicegginton/flip"
license=('MIT')
provides=(flip)
conflicts=(flip)
source=(https://github.com/dominicegginton/flip/releases/download/0.1.4/flip)
sha512sums=('408d51de7bfb384a09b82a0dd9f398e5492195bc8f12385586a5996aafa8d885ddd79d286c9a0b4ffe65011db35d41693b73ce3e54f93bd2350a19f541c04bfc')

package() {
  install -Dm755 "${srcdir}/flip" "${pkgdir}/usr/bin/flip"
}
