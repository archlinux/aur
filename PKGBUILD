# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.4.5
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
sha256sums_i686=('fbf12917de7dc4316e4918a4dd85ad8b2c0a716e0de66c9a654520416d55e8bb')
sha256sums_x86_64=('89b302f3bb9884fe2b772c3e96c91c3b1c6efbb9223d107dfbdce8dbb0f562e7')
sha256sums_armv7h=('a7846f105bc4c6e82fcd94f56a3ba284d129e5d333499fd8482a50221816e8c6')
sha256sums_aarch64=('78a4a9e731bab2cf2ed0ac8b1763655558f4c18090ab57ece4b076cbc5c42d0f')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
