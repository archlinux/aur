# Maintainer: Sigurt Bladt Dinesen <sigurt.bladt@gmail.com>
pkgname=orchid-zsh-completion
pkgdesc="zsh completion for orchid"
pkgver=3
pkgrel=1
arch=('any')
url=""
license=('custom')
provides=("orchid-zsh-completion")
sha1sums=('36cc17181b08ef4e997dd442adfd55885e2b51fb')
source=_orchid

package() {
  install -D $srcdir/_orchid $pkgdir/usr/share/zsh/site-functions/_orchid
}
