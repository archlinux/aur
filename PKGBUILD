# Maintainer: Hyper Focus <hyperfocusedblur@proton.me>
pkgname=gcr-ssh-agent-dinit
pkgver=1.0.0
pkgrel=1
pkgdesc="Dinit user service definition for starting gcr-ssh-agent - Gnome SSH agent, previously part of gnome-keyring"
url="https://gitlab.gnome.org/GNOME/gcr"
arch=('any')
license=('unknown')
depends=('gcr-4' 'gcr' 'dinit')
# makedepends=()
# checkdepends=()
optdepends=('userspawn' 'userspawn-dinit')
source=('gcr-ssh-agent.dinit-service' 'gcr-ssh-agent-start')
# backup=('')
sha256sums=('SKIP' 'SKIP')

package() {
   install -Dm644 "${srcdir}/gcr-ssh-agent.dinit-service" "${pkgdir}/etc/dinit.d/user/gcr-ssh-agent"
   install -Dm755 "${srcdir}/gcr-ssh-agent-start" "${pkgdir}/usr/bin/gcr-ssh-agent-start"
}
