# Maintainer: Zacharias Knudsen <zachasme@gmail.com>

pkgname=systemd-ssh-agent
pkgver=1.0.0
pkgrel=1
pkgdesc="A systemd user unit for the ssh-agent service"
url="https://wiki.archlinux.org/index.php/SSH_keys#Start_ssh-agent_with_systemd_user"
license=('GPL')
arch=('any')
install=ssh-agent.install
source=('ssh-agent.service')
sha256sums=('2bd29ee30f8d9d9c7887ad18c33de77fcb34e2f8d05e9fc3c889a90633855c5a')

package() {
  install -Dm644 "$srcdir"/ssh-agent.service "$pkgdir"/usr/lib/systemd/user/ssh-agent.service
}
