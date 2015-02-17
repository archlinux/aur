# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=plasma-workspace-agent-ssh
pkgver=1.0
pkgrel=1
pkgdesc="Startup and shutdown scripts for ssh-agent in KDE"
arch=('any')
url='https://www.archlinux.org/'
license=('GPL')
source=('ssh-agent-startup.sh' 'ssh-agent-shutdown.sh')
sha256sums=('e5635bd17c1e66b30d9161162c1c7ece259e5b5de8b93678c28184380cb19726'
            '92937da876224a2fb8a6d54faf85829328419f4f7c70da43f93e0798f70b7fb4')

package() {
  install -Dm755 ssh-agent-startup.sh "$pkgdir"/etc/xdg/plasma-workspace/env/ssh-agent-startup.sh
  install -Dm755 ssh-agent-shutdown.sh "$pkgdir"/etc/xdg/plasma-workspace/shutdown/ssh-agent-shutdown.sh
}
