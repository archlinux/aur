# Maintainer: cazeimke <your@email.com>
pkgname=ls3d-installer-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Official Learnspace 3D installer wrapper for Arch-based systems"
arch=('any')
url="https://github.com/Calisto1994/ls3dInstall"
license=('GPL3')
depends=('bash' 'curl')
install=ls3d-installer.install
source=("installScript.sh::https://raw.githubusercontent.com/Calisto1994/ls3dInstall/main/installScript.sh")
sha256sums=('13a98abe535d230cd02921aa7f5e66c66604a42bdc179c494a0e4dca31c18523')

package() {
  install -Dm755 "$srcdir/installScript.sh" "$pkgdir/usr/bin/ls3d-install"
}
