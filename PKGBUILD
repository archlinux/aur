pkgname=taskforge-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Taskforge CLI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/gentij/taskforge"
license=('custom')
provides=('taskforge')
conflicts=('taskforge')
source=("https://github.com/gentij/taskforge/releases/download/v1.0.1/taskforge_linux_amd64.tar.gz")
sha256sums=('019d11bb6f4166329af25dc5fb485a6a019f46a5e292bb46d4594c19f62df3c8')

package() {
  install -Dm755 "${srcdir}/taskforge" "${pkgdir}/usr/bin/taskforge"
}
