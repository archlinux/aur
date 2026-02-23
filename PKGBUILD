pkgname=taskforge-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Taskforge CLI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/gentij/taskforge"
license=('custom')
provides=('taskforge')
conflicts=('taskforge')
source=("https://github.com/gentij/taskforge/releases/download/v0.1.0/taskforge_linux_amd64.tar.gz")
sha256sums=('edea57a86a19dc2a043171a6766bae99be543a989199bd45df9bca44d38766cb')

package() {
  install -Dm755 "${srcdir}/taskforge" "${pkgdir}/usr/bin/taskforge"
}
