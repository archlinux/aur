pkgname=tuxonice-resume-hook
pkgver=1.0
pkgrel=2
pkgdesc="TuxOnIce resume hook for the ArchLinux initramfs"
url="https://aur.archlinux.org/packages/tuxonice-resume-hook/"
license=("GPL")
install=tuxonice-resume-hook.install
arch=('i686' 'x86_64')
depends=()
makedepends=()
options=('!makeflags')
source=('initcpio-install' 'initcpio-hook')
md5sums=('05a4fa94a61f9472f002fe4fa886462a'
         '89cf35216fb64ef3c94406fc8d729b30')

package () {
  install -D -m644 $srcdir/initcpio-install $pkgdir/usr/lib/initcpio/install/tuxonice
  install -D -m644 $srcdir/initcpio-hook    $pkgdir/usr/lib/initcpio/hooks/tuxonice
}
