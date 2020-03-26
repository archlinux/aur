# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=taskell-bin
pkgver=1.9.3
pkgrel=3
pkgdesc='Command-line Kanban board/task manager with support for Trello boards and GitHub projects'
arch=('x86_64')
url="https://taskell.app"
license=('Custom')
provides=('taskell')
depends=('ncurses5-compat-libs')
source=("https://github.com/smallhadroncollider/taskell/releases/download/${pkgver}/taskell-${pkgver}_x86-64-linux.tar.gz"
		"LICENSE::https://raw.githubusercontent.com/smallhadroncollider/taskell/master/LICENSE")
md5sums=('5dae563f46eb5d62d7663137bff1c788'
		 'b445947eb0aeab68a86949e549e145c4')

package() {
  install -Dm755 ${srcdir}/taskell "${pkgdir}/usr/bin/taskell"
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/taskell/LICENSE"
}
# vim:set ts=2 sw=2 et: