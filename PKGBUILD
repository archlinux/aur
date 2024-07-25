# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Nassiel <nassiel@tenthdimensions.com>
pkgname=kubitect
pkgver=3.4.0
pkgrel=1
pkgdesc="Kubitect provides a simple way to set up a highly available Kubernetes cluster across multiple hosts."
arch=("x86_64")
url="https://github.com/MusicDin/kubitect"
license=('Apache')
depends=('git' 'python')
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/MusicDin/kubitect/releases/download/v$pkgver/$pkgname-v$pkgver-linux-amd64.tar.gz")
md5sums=('496104740a3c64dac2c6e54d74d18666')

package() {
  install -Dm755 "kubitect" "${pkgdir}/usr/local/bin/kubitect"
}
