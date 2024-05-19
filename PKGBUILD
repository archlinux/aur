# Mainainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname=wipemychat-bin
_pkgname=wipemychat
pkgver=1.1.0
pkgrel=2
pkgdesc="Delete all your messages in public and private Telegram chats"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/rusq/wipemychat"
license=('GPL-3.0-or-later')
depends=()
makedepends=()
source_i686=(https://github.com/rusq/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz)
source_x86_64=(https://github.com/rusq/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz)
source_aarch64=(https://github.com/rusq/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz)
sha256sums_i686=('66a46dd7bdd7e241bf2072922cf220babc906095c7760771227f8fba19a2f8c9')
sha256sums_x86_64=('6e7c2ef29e1cea250dd7f3a2fbc525bd957d5bcf12689501072663f3659031af')
sha256sums_aarch64=('01491cbb04d96cdf1e1f54d3d3bf1dc870d3d65892aa279b14ab044d010e9ede')

package() {
  cd "$srcdir"
  install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
}
