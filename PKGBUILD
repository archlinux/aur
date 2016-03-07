# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Mike Dacre <mike@dacre.me>

pkgname=tmux-cssh
_pkgver=1.0.6-0
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="TMUX with a \"ClusterSSH\"-like behaviour"
arch=('any')
url="https://github.com/dennishafemann/tmux-cssh"
license=('Apache')
depends=('tmux')
makedepends=('git')
source=(https://github.com/dennishafemann/tmux-cssh/archive/$_pkgver.tar.gz)
md5sums=('12a6bc8254e9c35112c749182656273c')

package() {
  cd tmux-cssh-$_pkgver

  install -Dm755 tmux-cssh "$pkgdir"/usr/bin/tmux-cssh
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/tmux-cssh/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/tmux-cssh/README
}
