pkgname=allegro-dialog-dev
pkgver=5.2.3.0
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="This package is required to build programs that use the Allegro 5 dialog addon."
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('allegro' 'allegro-dialog' 'gtk2')
makedepends=('unzip')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("http://archive.ubuntu.com/ubuntu/pool/universe/a/allegro5/liballegro-dialog5-dev_5.2.3.0-1_amd64.deb")
source_aarch64=("http://ports.ubuntu.com/pool/universe/a/allegro5/liballegro-dialog5-dev_5.2.3.0-1_arm64.deb")
  
package()   {
    tar xf data.tar.xz
    cp --preserve=mode -r usr "${pkgdir}"
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
