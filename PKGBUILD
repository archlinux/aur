# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-mirrorlist
pkgver=20230301
pkgrel=2
pkgdesc="ALHP mirror list for use by pacman"
arch=('any')
url="https://somegit.dev/ALHP/alhp-mirrorlist"
license=('GPL')
backup=('etc/pacman.d/alhp-mirrorlist'
	'etc/pacman.d/alhp-mirrorlist.ipfs')
source=("https://somegit.dev/ALHP/alhp-mirrorlist/archive/$pkgver.tar.gz")
b2sums=('b62f35cc9e3557b2eccdcefddb9b919783d2de9d660dc76e9bff952b30f84a704ad70ec9ebd70c7e222deffb37a57c7470994d2d41b981bc6626a6db4de22ec7')

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m644 "$srcdir/alhp-mirrorlist/mirrorlist" "$pkgdir/etc/pacman.d/alhp-mirrorlist"
  install -m644 "$srcdir/alhp-mirrorlist/mirrorlist.ipfs" "$pkgdir/etc/pacman.d/alhp-mirrorlist.ipfs"
}
