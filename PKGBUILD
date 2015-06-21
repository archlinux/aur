#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=repoman
pkgver=2013.7
pkgrel=1
pkgdesc='The pacman of repository managers.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/repoman"
depends=(python3)
backup=(etc/repoman/json/urls.json)
source=(
  http://xyne.archlinux.ca/projects/repoman/src/repoman-2013.7.tar.xz
  http://xyne.archlinux.ca/projects/repoman/src/repoman-2013.7.tar.xz.sig
)
sha512sums=(
  895a59155c1bbde7ea7fe7c0b8525d18db29e2468b412d465ff772070d73944d77915daad34bc26b9a9ab91ca19fb796e33eb647b7d43398e0d89dd465a5993a
  56ed454884cb8d96ba2017eabc672ec08095055991704f5844ee7be2a20055ec4392986f31ccc03452753b7988ba2261be2a39135ae665ab9169a46e30ef69bb
)
md5sums=(
  39c1650d3e60222c585e9fb13a226cc5
  5b405ebde4c9bf774053da1650b527eb
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/urls.json" "$pkgdir/etc/repoman/json/urls.json"
}

# vim: set ts=2 sw=2 et:
