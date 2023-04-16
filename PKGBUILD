# Author:   Ishitatsuyuki 
# Packager: Adrian Lopez <zeioth@hotmail.com>
pkgname=latencyflex2-git
_pkgname=latencyflex2
pkgver=1.0.0
pkgrel=3
pkgdesc="Allow you to enable Reflex in compatible games."
arch=(any)
url="https://github.com/Zeioth/latencyflex2-installer"
license=('Apache 2.0')
makedepends=(git rustup wine meson mingw-w64-gcc mingw-w64-headers glslang python3)
provides=(latencyflex2-git)
conflicts=(latencyflex2 latencyflex latencyflex-git)
source=("git+$url")
sha256sums=('SKIP')

package() {
  "${srcdir}"/"${_pkgname}"-installer/install.sh
}
