pkgname=taskforge-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Taskforge CLI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/gentij/taskforge"
license=('custom')
provides=('taskforge')
conflicts=('taskforge')
source=("https://github.com/gentij/taskforge/releases/download/v1.0.0/taskforge_linux_amd64.tar.gz")
sha256sums=('7d1fa968b4a51d5ace2510d270202e0fee97c931fad0792a2137607ab4614d52')

package() {
  install -Dm755 "${srcdir}/taskforge" "${pkgdir}/usr/bin/taskforge"
}
