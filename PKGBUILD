# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=jq.sh
pkgname=$_pkgname-bin
pkgver=0.3.0.r1
pkgrel=1
pkgdesc='jq-in-shell integration library'
arch=(any)
license=(MPL2)
url='https://git.stefanwimmer128.eu/stefanwimmer128/jq.sh'
depends=('sh' 'jq' 'moreutils')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.tar.zst::https://git.stefanwimmer128.eu/stefanwimmer128/jq.sh-pkgbuild/-/package_files/58/download")
sha256sums=('5404a009e99d1d42c2bedc8e6e1792bc11f93de88fdead7303d2d4ccb5a28488')

build() {
  rm "$_pkgname-$pkgver.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
