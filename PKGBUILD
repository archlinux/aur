# Maintainer: Kevin Stephen <kands-code@qq.com>
pkgname=torchstudio
pkgver=0.9.14
pkgrel=1
# epoch=1
pkgdesc="IDE for PyTorch and its ecosystem"
arch=('x86_64')
url='https://torchstudio.ai/'
license=('MIT')
# groups=()
depends=('python')
# makedepends=()
# checkdepends=()
# optdepends=()
provides=('torchstudio')
# conflicts=()
# replaces=()
# backup=()
options=(!strip !zipman)
# install=$pkgname.install
# changelog=
source=("https://github.com/TorchStudio/${pkgname}/releases/download/${pkgver}/TorchStudio_${pkgver}-Linux_Installer.deb")
# noextract=()
sha256sums=('c5c93535676e29048e122fabeffa0eb569496682c8e22b0aab6ba0013dfa4087')
# validpgpkeys=()

# prepare() {
#   cd "$pkgname-$pkgver"
#   patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

# build() {
#   cd "$pkgname-$pkgver"
#   ./configure --prefix=/usr
#   make
# }

# check() {
#   cd "$pkgname-$pkgver"
#   make -k check
# }

package() {
  # extract
  bsdtar -xf data.tar.xz -C "${pkgdir}/"  
  # fix permission
  chmod -R 755 "${pkgdir}/"
}
