pkgname=yaknewtab
pkgver=1.0
pkgrel=1
epoch=1
pkgdesc='A shell script for opening new Yakuake tabs/sessions'
arch=(any)
url=https://aur.archlinux.org/cgit/aur.git/tree/yaknewtab.sh?h=yaknewtab
license=(GPL-3.0)

source=(yaknewtab.sh yaknewtab-run.desktop)
sha256sums=('cb040bb3b1882494bd20f31981c3e0965fd7deb3ec6486ff548d1275be12238c'
            '2703fbc0fc55acc5a4055823f829e8eeddab629597ae6d12c46cd76aaffbf4f4')

depends=( bash qt6-tools yakuake )
makedepends=( coreutils )

provides=("${pkgname}")
conflicts=("${pkgname}")

package() {
  install -Dm755 yaknewtab.sh "${pkgdir}/usr/local/bin/yaknewtab"
  install -Dm644 yaknewtab-run.desktop "${pkgdir}/usr/share/kio/servicemenus/yaknewtab-run.desktop"
}
