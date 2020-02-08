# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=git-delta-bin
_pkgname=git-delta
pkgver=0.0.16
pkgrel=1
pkgdesc="A syntax-highlighting pager for git"
arch=('x86_64')
url="https://github.com/dandavison/delta"
license=('MIT')
depends=('git')
conflicts=('git-delta')
source=(https://github.com/dandavison/delta/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb)
sha256sums=('5cc7353414f10cb722f14958efbcba8d223cb4162ea07048c40581654b696436')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
