# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=zellij-selector
pkgname=$_pkgname-bin
pkgver=1.2.2
pkgrel=3
pkgdesc="Select zellij session"
arch=(any)
license=(MPL2)
url=https://git.stefanwimmer128.eu/stefanwimmer128/zellij-selector
depends=('sh' 'libnewt' 'zellij')
optdepends=('fish: Option to option fish shell'
            'zsh: Option to open zsh shell'
            'bash: Option to open bash shell')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver-$pkgrel.tar.zst::https://git.stefanwimmer128.eu/stefanwimmer128/zellij-selector-pkgbuild/-/package_files/49/download")
sha256sums=('3819c14fa41b9ba0f6f29a2392fb127bb267dfd05bc0c00c6fef609dcc03a20b')

build() {
  rm "$_pkgname-$pkgver-$pkgrel.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
