# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.6.0
pkgrel=1
pkgdesc='A viewer for git and diff output'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/dandavison/delta'
license=('MIT')
provides=('git-delta')
conflicts=('git-delta' 'git-delta-git')
source_i686=("$url/releases/download/$pkgver/${_pkgname}_${pkgver}_i386.deb")
source_x86_64=("$url/releases/download/$pkgver/${_pkgname}_${pkgver}_amd64.deb")
source_armv7h=("$url/releases/download/$pkgver/${_pkgname}_${pkgver}_armhf.deb")
source_aarch64=("$url/releases/download/$pkgver/${_pkgname}_${pkgver}_arm64.deb")
sha256sums_i686=('e9d750ab1850d3d2f762fc700acc8d3b6b3f6ae5d5f5919c97e9188fed7d3312')
sha256sums_x86_64=('ae95e1d095c39e5d0ee5d93dedbabf8b899a59144746ae58630f10fc5a5d71e4')
sha256sums_armv7h=('3044dfbb3398cb219dff143d93f37d8527c6b1d27674d874fba61f3c9e3e9087')
sha256sums_aarch64=('dcf98e5127ed13fbf004068bd8aca54936c56a112b9418d15336ba07e5ac22e2')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
