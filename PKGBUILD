#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=relight
pkgver=2015
pkgrel=1
pkgdesc='Save and restore backlight settings.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/relight"
optdepends=('dialog: for relight-menu support')
source=(
  http://xyne.archlinux.ca/projects/relight/src/relight-2015.tar.xz
  http://xyne.archlinux.ca/projects/relight/src/relight-2015.tar.xz.sig
)
sha512sums=(
  ad0adec20551a585b1a50a6706d441d463205f042f70ddecc8824e76b9f591a617e06f44921f2824a822d9909048ac6f29dcd904d0e10cda84d485ec5fdc5aac
  e090b1850e600af3f6b2ad1cc26aef9e0e470b25c2091c14402525dedb2874d0931f3ba8fb2d738d61d59f44135d526e2ea000ff7a6dea5756c540397e1bc1cf
)
md5sums=(
  7c4a37d2cc54b6a87cb017b1803d9d01
  744ecda76c99f901f7d9a0ce6bc5fb22
)
install=relight.install
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$pkgname"-menu "$pkgdir/usr/bin/$pkgname"-menu
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

# vim: set ts=2 sw=2 et:
