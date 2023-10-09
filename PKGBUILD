# Maintainer: Andrew Munkres <amunkres@nyx.net>
# Contributor: Dmitry Ivanov <ivadmi5 at gmail dot com>
# Contributor: Zacharias Knudsen <zachasme@gmail.com>

pkgname=ssh-agent-env-var
pkgver=1.0.0
pkgrel=1
pkgdesc="An /etc/profile.d script to set the environment variable for ssh-agent"
url="https://wiki.archlinux.org/index.php/SSH_keys#Start_ssh-agent_with_systemd_user"
license=('GPL')
arch=('any')
optdepends=('openssh: ssh-agent and its systemd user unit')
conflicts=('systemd-ssh-agent>1.0.0-1')
install=ssh-agent.install
source=('ssh-auth-sock.sh')
sha256sums=('c04f183ce1b97cb225aea1db2ae908dc70669066935717ea3d5b171bc10455a0')

package() {
  install -Dm644 "$srcdir"/ssh-auth-sock.sh "$pkgdir"/etc/profile.d/ssh_auth_sock.sh
}
