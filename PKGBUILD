# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=pingpong
pkgver=1.0
pkgrel=1
pkgdesc="Show internet connection status by ping"
arch=('any')
license=('GPL')
maintainer="Mohammad Rosstami <mohammad.jayant@gmail.com>"
source=("pingpong.sh")
depends=('bash' 'coreutils')
pkgrel=1
sha256sums=('SKIP')
package() {
  install -Dm755 pingpong.sh "${pkgdir}/usr/bin/pingpong"
}