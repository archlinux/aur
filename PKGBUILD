# Maintainer: Santiago Torres-Arias <santiago at archlinux dot org>

pkgname=repeatr-bin
pkgver=0.15
_language='en-US'
pkgrel=1
pkgdesc="Repeatr is a tool for sandboxing processes so they become guaranteed runable on another machine (at another time, at another place -- even offline)."
arch=('x86_64')
url="https://repeatr.io"
license=('Apache')
depends=('glibc')
source_x86_64=("https://github.com/polydawn/repeatr/releases/download/release%2Fv${pkgver}/repeatr-linux-amd64-v${pkgver}.tar.gz")
# source+=()
sha512sums_x86_64=('9f5746b2e2e4981516b3272067fce6463420217fc1e0ce3c8949a87961f95bad9d4c5b1e9797daa4a0f47718e4b4d8b4538c63345ad1080d1350a90094e472e7')
validpgpkeys=('')

package() {
  cd $srcdir

  install -Dm 755 repeatr $pkgdir/usr/bin/repeatr

}
