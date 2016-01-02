pkgname=lexicon-dictionary
pkgver=2.0
pkgrel=2
pkgdesc="Lexicon is an instant dictionary for Linux."
arch=('any')
url="http://insomniacprogrammer.net16.net"
depends=('yad' 'xbindkeys' 'xsel')
source=("http://downloads.sourceforge.net/project/lexicon-dictionary/lexicon-dictionary-2.0.tar.xz")
md5sums=('bc88a123c42bf4cc0bde2ab5a1787736')

package()  {
cd "$srcdir"
install -D -m755 "$pkgname-$pkgver/usr/bin/lexicon" "$pkgdir/usr/bin/lexicon"
install -D -m755 "$pkgname-$pkgver/usr/lib/lexicon/About" "$pkgdir/usr/lib/lexicon/About"
install -D -m755 "$pkgname-$pkgver/usr/lib/lexicon/AutoCorrect" "$pkgdir/usr/lib/lexicon/AutoCorrect"
install -D -m755 "$pkgname-$pkgver/usr/lib/lexicon/Credits" "$pkgdir/usr/lib/lexicon/Credits"
install -D -m755 "$pkgname-$pkgver/usr/lib/lexicon/Help" "$pkgdir/usr/lib/lexicon/Help"
install -D -m755 "$pkgname-$pkgver/usr/lib/lexicon/Launch" "$pkgdir/usr/lib/lexicon/Launch"
install -D -m755 "$pkgname-$pkgver/usr/lib/lexicon/Lexicon" "$pkgdir/usr/lib/lexicon/Lexicon"
install -D -m755 "$pkgname-$pkgver/usr/share/lexicon/data.db" "$pkgdir/usr/share/lexicon/data.db"
install -D -m755 "$pkgname-$pkgver/usr/share/lexicon/spellcheck" "$pkgdir/usr/share/lexicon/spellcheck"
install -D -m755 "$pkgname-$pkgver/usr/share/lexicon/synonym.db" "$pkgdir/usr/share/lexicon/synonym.db"
install -D -m755 "$pkgname-$pkgver/usr/share/man/man1/lexicon.1.gz" "$pkgdir/usr/share/man/man1/lexicon.1.gz"

}

