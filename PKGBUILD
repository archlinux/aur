# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : grimsock <lord.grimsock at gmail dot com>
# Contributor : Joel Sevilleja Febrer Joel7987[at].gmail.com


pkgname=htmlunit

pkgver=2.61.0
pkgrel=2

pkgdesc='Headless HTTP webclient for Java'
arch=('any')
url="http://$pkgname.sourceforge.net"
license=('Apache')

provides=("$pkgname-doc")
conflicts=("$pkgname-doc")

depends=('java-runtime')

#source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver-bin.zip")
source=("https://github.com/$pkgname/$pkgname/releases/download/$pkgver/$pkgname-$pkgver-bin.zip")
sha256sums=('0ad94f78ff5c937b6a2a5eb5af7a930a4993e8c980617d7aad33a436d58bf1a0')


package() {
  cd "$pkgname-$pkgver/lib"
  install -Dm644 *.jar -t"$pkgdir/usr/share/java/$pkgname/"
  #install -dm755 "$pkgdir/usr/share/doc"
  #cp -a --no-preserve=o "$pkgname-$pkgver/apidocs" "$pkgdir/usr/share/doc/$pkgname"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
