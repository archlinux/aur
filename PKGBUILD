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
sha256sums=('29ec4e634659949e6cdc8dffd38354499eb7489203c7990fc51ac79dc6df134c')

package() {
  install -Dm755 "${srcdir}/taskforge" "${pkgdir}/usr/bin/taskforge"
}
