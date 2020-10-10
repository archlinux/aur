# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.4.4
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
sha256sums_i686=('c759c05844068953033c8377790705b4e1d460ce1f65d18b3eb414945c9b792c')
sha256sums_x86_64=('2d801257d2eb212dfef3c3b4aebb895aca8772bf9689d0af4bc23474f7a9f9bd')
sha256sums_armv7h=('857730b6b0db9c8c17fecbe986353ca0f699b660bbd84d4805f999cd0a4537d1')
sha256sums_aarch64=('eb3f168b9d37cc2e498cd1769751f0c0752f96558304a25ba1d069c51472c5e4')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
