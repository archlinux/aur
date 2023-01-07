# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=jq.sh
pkgname=$_pkgname-bin
pkgver=0.1.0.r1
pkgrel=1
pkgdesc='jq-in-shell integration library'
arch=(any)
license=(MPL2)
url=https://shellspec.info
depends=('sh' 'jq')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.tar.zst::https://git.stefanwimmer128.eu/stefanwimmer128/jq.sh-pkgbuild/-/package_files/55/download")
sha256sums=('689bb2ee18df4b16cf2149dbc9f2ce4c34ec73e1eaa89ad1d4766d3b16f36fbc')

build() {
  rm "$_pkgname-$pkgver.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
