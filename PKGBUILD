# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=taskell-bin
pkgver=1.11.4
pkgrel=1
pkgdesc='Command-line Kanban board/task manager with support for Trello boards and GitHub projects'
arch=('x86_64')
url="https://taskell.app"
license=('Custom')
provides=('taskell')
depends=('ncurses5-compat-libs')
source=("https://github.com/smallhadroncollider/taskell/releases/download/${pkgver}/taskell-${pkgver}_x86-64-linux.tar.gz"
		"LICENSE::https://raw.githubusercontent.com/smallhadroncollider/taskell/master/LICENSE")
sha256sums=(
    'faf553c12c5c52f9fb7f8a89b54aa9ca5ca3f5f2f0f71db5cf4669263522f4d1'
    '04dc83953b60b17ab28cbc37ad3188e1c632db38dd423885af7507460f461d29'
)

package() {
  install -Dm755 "${srcdir}/taskell" "${pkgdir}/usr/bin/taskell"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/taskell/LICENSE"
}
# vim:set ts=2 sw=2 et:
