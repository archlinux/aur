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
sha256sums=('899a277ca42411498207afe1667afa087d8de6ce716c4a93f6c85e0aead423b3')

package() {
  install -Dm755 "${srcdir}/taskforge" "${pkgdir}/usr/bin/taskforge"
}
