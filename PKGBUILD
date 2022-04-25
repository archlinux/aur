# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : grimsock <lord.grimsock at gmail dot com>
# Contributor : Joel Sevilleja Febrer Joel7987[at].gmail.com


pkgname=htmlunit

pkgver=2.61.0
pkgrel=1

pkgdesc='Headless HTTP webclient for Java'
arch=('any')
url="http://$pkgbase.sourceforge.net"
license=('Apache')

provides=("$pkgname-doc")
conflicts=("$pkgname-doc")

depends=('java-runtime')

#source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver-bin.zip")
source=("https://github.com/$pkgname/$pkname/releases/download/$pkgver/$pkgname-$pkgver-bin.zip")
sha256sums=('292b527fb77e1470428c5b7e8363d16146e6d28af6ad97ce5ad76ccfd933f59e')


package() {
  cd "$pkgname-$pkgver/lib"
  install -Dm644 *.jar -t"$pkgdir/usr/share/java/$pkgname/"
  #install -dm755 "$pkgdir/usr/share/doc"
  #cp -a --no-preserve=o "$pkgname-$pkgver/apidocs" "$pkgdir/usr/share/doc/$pkgname"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
