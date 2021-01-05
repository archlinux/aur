# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.5.1
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
sha256sums_i686=('f52608eb90aa1b27259ace7b3f7ebea536ff4183798a6c87e1d4aac29459802b')
sha256sums_x86_64=('d796d3b75d690afd29fd426e7db3792724c0074b9c7b2d3aea59a3d78e735f42')
sha256sums_armv7h=('3ffe9b19c5612805b04b9ce10a1aba880daf69799bd47d510ccf865608c5f0d3')
sha256sums_aarch64=('b717de95285921324171d7a95d5ac17b648abfc0abc67d2ad70c4ef5be8a9763')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
