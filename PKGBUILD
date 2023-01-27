# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=jq.sh
pkgname=$_pkgname-bin
pkgver=0.4.0.r1
pkgrel=1
pkgdesc='jq-in-shell integration library'
arch=(any)
license=(MPL2)
url='https://git.stefanwimmer128.eu/stefanwimmer128/jq.sh'
depends=('sh' 'jq' 'moreutils')
optdepends=('yq: Adds support for yq, xq and tomlq')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.tar.zst::https://git.stefanwimmer128.eu/stefanwimmer128/jq.sh-pkgbuild/-/package_files/62/download")
sha256sums=('ae8cb9b4f61db2dfb94c00cf23d187c6d1f75fa0c3700c67163120cb9a35f035')

build() {
  rm "$_pkgname-$pkgver.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
