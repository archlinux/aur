#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=voracious
pkgver=2012.12.24.1
pkgrel=2
pkgdesc='A customizable web feed aggregator for your browser.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/voracious"
depends=(python2 python2-feedparser python2-xynehttpserver)
source=(
  http://xyne.archlinux.ca/projects/voracious/src/voracious-2012.12.24.1.tar.xz
  http://xyne.archlinux.ca/projects/voracious/src/voracious-2012.12.24.1.tar.xz.sig
)
sha512sums=(
  9b8a5cb5fef306d1cc326970a695568121d46de782960a18d6baaa113a26b68b7a013b4bd45691c3bf88434ea888753b8bad6e8d6656c70451e8937e48a7da7c
  bec2a7c17c693ea341dc0f6280c19af43ed1f08d65a435816246d5ca78fa36f0808c2289b225c70d4a23a10ad34de62a0ff07742eb54df74d681c7fd0d62d950
)
md5sums=(
  57d52214fe4634e1435ac845303d5fe8
  0da7505fc5f45b19fff26fd0be2b27a5
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm644 "$srcdir/$pkgname-$pkgver/man/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz";
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
