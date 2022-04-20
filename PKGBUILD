# Maintainer: noobping <hello@noobping.dev>
pkgname=git-estimate-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Estimates hours and days spent by all developers on a git repository "
arch=('x86_64')
url="https://github.com/luigitni/git-estimate"
license=('MIT')
depends=('git-hours')
makedepends=('zip')
source=("$url/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64.zip")
sha512sums=('50a63747721a8a7de1f65ea654f96efef57a32a80d341ccdf061fbc982658b5a2b35080c269beba60aab5274e8cfb188bba1d96f0a061b1e226e88f520e47390')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir"/usr/bin
  install -m 555 "${srcdir}"/${pkgname%-bin}-linux-amd64 "$pkgdir"/usr/bin/${pkgname%-bin}
}
