# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=zellij-selector
pkgname=$_pkgname-bin
pkgver=1.2.2
pkgrel=2
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
source=("$_pkgname-$pkgver-$pkgrel.tar.zst::https://git.stefanwimmer128.eu/stefanwimmer128/zellij-selector-pkgbuild/-/package_files/48/download")
sha256sums=('67231cd76d81e5a3d98dab237e22a7ca084f14cdfd551488f6ce7c7f0eba9c74')

build() {
  rm "$_pkgname-$pkgver-$pkgrel.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
