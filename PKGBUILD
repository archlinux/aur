pkgname=taskforge-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Taskforge CLI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/gentij/taskforge"
license=('custom')
provides=('taskforge')
conflicts=('taskforge')
source=("https://github.com/gentij/taskforge/releases/download/v0.1.1/taskforge_linux_amd64.tar.gz")
sha256sums=('783850f191f2e4fd77b3a2f0c69ff8f90427ad26ed9fc76137bd5031b15456f0')

package() {
  install -Dm755 "${srcdir}/taskforge" "${pkgdir}/usr/bin/taskforge"
}
