pkgname=taskforge-bin
pkgver=0.0.0
pkgrel=1
pkgdesc="Taskforge CLI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/gentij/taskforge"
license=('custom')
provides=('taskforge')
conflicts=('taskforge')
source=("taskforge::https://github.com/gentij/taskforge/releases/download/v${pkgver}/taskforge_linux_amd64")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/taskforge" "${pkgdir}/usr/bin/taskforge"
}
