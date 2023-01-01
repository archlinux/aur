# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=zellij-selector
pkgname=$_pkgname-bin
pkgver=2.0.0.r1
pkgrel=1
pkgdesc="Select zellij session"
arch=(any)
license=(MPL2)
url=https://git.stefanwimmer128.eu/stefanwimmer128/zellij-selector
depends=('sh' 'libnewt' 'zellij' 'jq')
optdepends=('fish: Option to option fish shell'
            'zsh: Option to open zsh shell'
            'bash: Option to open bash shell')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.tar.zst::https://git.stefanwimmer128.eu/stefanwimmer128/zellij-selector-pkgbuild/-/package_files/51/download")
sha256sums=('5c17a0ca29902a97b9bc64b85e39c09b868335fd739e0aac0f64c69f8f317079')

build() {
  rm "$_pkgname-$pkgver.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
