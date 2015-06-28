# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Roman G <chesercat@gmail.com>

pkgname=bash-completion-atool
pkgver=0.3
pkgrel=1
pkgdesc="bash completion for atool"
arch=('any')
url="http://linux4all.blogsome.com"
license=('GPL')
depends=('bash-completion')
source=('atool')
md5sums=('b90e91fd266a4bdde15479281283620c')

build() {
  cd "${srcdir}"

  install -Dm644 atool "${pkgdir}"/etc/bash_completion.d/atool
}
