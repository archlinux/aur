# Contributor: Roman G <chesercat@gmail.com>
pkgname=bash-completion-atool
pkgver=0.3
pkgrel=1
pkgdesc="bash completion for atool"
arch=('i686' 'x86_64')
url="http://linux4all.blogsome.com"
license=('GPL')
depends=('bash-completion')
source=('atool')
md5sums=('b90e91fd266a4bdde15479281283620c')

build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/etc/bash_completion.d  || return 1
  cp atool $startdir/pkg/etc/bash_completion.d/atool || return 1
}
