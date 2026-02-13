# Maintainer: KevinCrrl

pkgname=arduino-language-server-noclang-bin
_pkgname=${pkgname%-noclang-bin}
pkgver=0.7.7
pkgrel=1
pkgdesc="An Arduino Language Server based on Clangd to Arduino code autocompletion\
 (Without using clang as a dependency, only clangd)"
arch=('x86_64')
url="https://github.com/arduino/arduino-language-server"
license=('AGPL3')
depends=('glibc' 'arduino-cli' 'clangd')
options=('!debug')
source=("$url/releases/download/$pkgver/${_pkgname}_${pkgver}_Linux_64bit.tar.gz")
sha512sums=('ea4f8fb38b2eec7fe633841ab437606574292258c05d76d8eef80565097bf0694edcaac26a5b3931e3fb2f02194c42ca996d21c15487c5bae972249abc12675b')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

