# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : grimsock <lord.grimsock at gmail dot com>
# Contributor : Joel Sevilleja Febrer Joel7987[at].gmail.com


pkgname=htmlunit

pkgver=2.62.0
pkgrel=1

pkgdesc='Headless HTTP webclient for Java'
arch=('any')
url="http://$pkgname.sourceforge.net"
license=('Apache')

#provides=("$pkgname-doc")
#conflicts=("$pkgname-doc")

depends=('java-runtime')

#source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver-bin.zip")
source=("https://github.com/$pkgname/$pkgname/releases/download/$pkgver/$pkgname-$pkgver-bin.zip")
sha256sums=('5714ec57ac9acacd073e7147bf070f29ad92f1fe9163947c261c5dcb042a1ae4')


package() {
  cd "$pkgname-$pkgver/lib"
  install -Dm644 *.jar -t"$pkgdir/usr/share/java/$pkgname/"
  #install -dm755 "$pkgdir/usr/share/doc"
  #cp -a --no-preserve=o "$pkgname-$pkgver/apidocs" "$pkgdir/usr/share/doc/$pkgname"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
