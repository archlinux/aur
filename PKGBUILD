# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=gitree
pkgver=1.0.7
pkgrel=1
pkgdesc='Prints a directory files tree that shows Git status ignoring files from .gitignore'
arch=('any')
url='https://github.com/jpwilliams/gitree'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)

package() {
  npm install --user root -g --prefix="${pkgdir}"/usr gitree@${pkgver}
}
