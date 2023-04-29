# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=fzf-kill
_pkgname=fzf-kill
pkgver=1.4.1
pkgrel=10
pkgdesc="kill -9 with fzf"
arch=(any)
url="https://github.com/Zeioth/fzf-kill.git"
license=('GPL3')
depends=(fzf)
provides=(fzf-kill)
conflicts=(fzf-kill-git)
source=("git+$url")
sha256sums=('SKIP')

package() {
   mkdir -p "$pkgdir"/usr/bin
   install -m 555 "${srcdir}"/fzf-kill/fzf-kill "$pkgdir"/usr/bin/fzf-kill
}
