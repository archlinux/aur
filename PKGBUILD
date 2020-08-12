# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.4.1
pkgrel=2
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
sha256sums_i686=('e1eecad69609d522ebc7084c2c34f62aadca7226f51669afd2d0d7dda8f7974c')
sha256sums_x86_64=('b5cbe9309edd0c3ef3c04e130d4aedebcefd345a92a36f73525383045d6566b1')
sha256sums_armv7h=('06b2f9cedaabce4a69d7022f3e0435d3bea474df15f96d5d7c5c899557990281')
sha256sums_aarch64=('0e6093a1822e16a2212a79d62141a01a766f197eb8cebfcfbde6aa490a2ddf74')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
