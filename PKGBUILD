# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=zellij-selector
pkgname=$_pkgname-bin
pkgver=2.2.0.r1
pkgrel=1
pkgdesc="Select zellij session"
arch=(any)
license=(MPL2)
url=https://git.stefanwimmer128.eu/stefanwimmer128/zellij-selector
depends=('sh' 'libnewt' 'zellij' 'jq.sh')
optdepends=('fish: Option to option fish shell'
            'zsh: Option to open zsh shell'
            'bash: Option to open bash shell')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.tar.zst::https://git.stefanwimmer128.eu/stefanwimmer128/zellij-selector-pkgbuild/-/package_files/59/download")
sha256sums=('9056c1a2148b841ff2b73a1d4749e825776768af324052d9d55365cb116424a7')

build() {
  rm "$_pkgname-$pkgver.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
