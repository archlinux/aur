# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.5.0
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
sha256sums_i686=('ad75b18b4386e37eaa553770a60610bf50a098663c2c84cd558e9973d8fa83c3')
sha256sums_x86_64=('ceb2f700269d944b78e94d5eb6a6866303d28b69ce5788154644418d891decef')
sha256sums_armv7h=('ee11ec417206f22ec9faf47a6a873dae1d9a9a67599eceb68ad016b924ac2949')
sha256sums_aarch64=('85b2a7af88a94c71a58c3227e61d57c0b81433be66ffd9034e7dbb6480cae9d8')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
