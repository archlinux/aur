# Maintainer: GT610 <myddz1005@163.com>

pkgname=('keyviz-deb')
pkgver=2.0.0a
pkgrel=1
pkgdesc="A free and open-source tool to visualize your keystrokes keyboard in real-time (Official deb package build)"
arch=('x86_64')
url="https://github.com/mulaRahul/keyviz"
license=('GPL')
source=("https://github.com/mulaRahul/keyviz/releases/download/v${pkgver}/keyviz_v${pkgver}_x64.deb")
md5sums=('30417549713acaf7fa3ed708221e4410')
sha256sum=('6edd9dd5b71b7fca0cb6e796148e74278cbaca2bffe0797511d176b1db57aeea')

package() {
  bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
  echo "Currently keyviz for GNU/Linux is in alpha release. It may not work properly or have some bugs. \
  For any issues about the application itself, please refer to https://github.com/mulaRahul/keyviz/issues."
}