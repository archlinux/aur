# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
_pkgcore=cimguisdl2cross
pkgname=${_pkgcore}-bin
pkgver=r2
pkgrel=1
pkgdesc="exelix11's fork of cimgui for SDL2 cross-platform use"
arch=('x86_64')
url="https://github.com/exelix11/CimguiSDL2Cross"
license=('GPL-2.0-only')
provides=(${_pkgcore} 'cimgui')
conflicts=(${_pkgcore} 'cimgui')
depends=('libgcc' 'libstdc++' 'sdl2' 'glibc')
source=("https://github.com/exelix11/CimguiSDL2Cross/releases/download/${pkgver}/linux-x64.zip")
sha256sums=('d36d08d90e6f9c03a89c8e0739ffe8a49c4af004ed6755fc8b1a506598f6da4f')

package() {
	install -Dm755 -t "$pkgdir/usr/lib" cimgui.so
} 
