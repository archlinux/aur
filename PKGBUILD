# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=urxvtcd
pkgver=2
pkgrel=2
pkgdesc="A script to start urxvt (rxvt-unicode) in daemon-client mode"
arch=('any')
url="http://packages.debian.org/unstable/x11/rxvt-unicode"
license=('GPL')
depends=('rxvt-unicode')
source=(urxvtcd.sh urxvtcd.1)
md5sums=('6ed3f7379d592031204530071861384a'
         'fb28f0aae8279b64b40cd155381fe611')

package() {
  cd "${srcdir}"

  install -D -m755 $pkgname.sh "${pkgdir}"/usr/bin/$pkgname
  install -D -m644 $pkgname.1 "${pkgdir}"/usr/share/man/man1/$pkgname.1
}
