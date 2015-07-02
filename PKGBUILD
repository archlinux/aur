# Contributor: 3ED <kas1987@o2.pl>

arch=('i686' 'x86_64')
license=('GPL2 or later')
pkgname=bash-completion-xmms2
pkgver=20051023
pkgrel=2
pkgdesc="bash-completion for xmms2"
depends=('bash-completion' 'xmms2')
source=(http://aspellfr.free.fr/xmms2/xmms2_completion)
url="http://aspellfr.free.fr/"
md5sums=('d9e716f0038a48b486fddaa30609f2ca')

build() {
  mkdir -pv $startdir/pkg/etc/bash_completion.d
  install -v -m 644 $startdir/src/xmms2_completion $startdir/pkg/etc/bash_completion.d/xmms2
}
