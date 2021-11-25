# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-mirrorlist
pkgver=20211125
pkgrel=1
pkgdesc="ALHP mirror list for use by pacman"
arch=('any')
url="https://git.harting.dev/anonfunc/alhp-mirrorlist"
license=('GPL')
backup=(etc/pacman.d/alhp-mirrorlist)
source=("https://git.harting.dev/anonfunc/$pkgname/raw/branch/master/mirrorlist")

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m644 "$srcdir/mirrorlist" "$pkgdir/etc/pacman.d/"
}

b2sums=('0623cda6eb0d4a0c7946395dbe433de7499bc83081a781247e16374cc96dfb7452d30d212edcefffa86d9dc632f6e4ae331cc5f9a0ac0583ed4b9aab75df1f9a')
