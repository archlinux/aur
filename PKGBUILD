# Maintainer: Mr Green

pkgname=beerfetch
pkgver=0.1
pkgrel=1
pkgdesc="A very basic bash version of neofetch"
arch=('any')
url="https://github.com/mrgreen3/beerfetch"
license=('GPL')
depends=('bash')
source=("https://github.com/mrgreen3/beerfetch/archive/refs/heads/main.tar.gz")
sha256sums=('09192b02879860610707aae9219861811acd29984ab8aa62fbb2c9b0de28b5e5')

build() {
  cd "$srcdir/beerfetch-main"
  # No specific build instructions needed for a bash script
}

package() {
  cd "$srcdir/beerfetch-main"
  install -Dm755 beerfetch "$pkgdir/usr/bin/beerfetch"
}

