# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.4.3
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
sha256sums_i686=('7ec3b7049bca51f88d88c45a262692dd2a82f254282159acec0a2ba4447e4e4b')
sha256sums_x86_64=('5465acfedfb6791dd22e4c2d9c7bb2fdc60acb37a914da2f6a9a9ee6e6b22bb4')
sha256sums_armv7h=('02b80341e394ac325e28d44eb5f51420452f0b925e34f8e629ac6bb45e53028c')
sha256sums_aarch64=('97e359d8fdda92b3e9525794c453ebf957d6da8b03515c0eb7aae92fc9f302c3')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
