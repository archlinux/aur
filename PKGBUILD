# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : grimsock <lord.grimsock at gmail dot com>
# Contributor : Joel Sevilleja Febrer Joel7987[at].gmail.com


pkgname=htmlunit

pkgver=2.50.0
pkgrel=1

pkgdesc='Headless HTTP webclient for Java'
arch=('any')
url="http://$pkgname.sourceforge.net/"
license=('Apache')

depends=('java-runtime-common')

source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver-bin.zip")
sha256sums=('630354b90695dfd5c3fd32cf4a8bd8eb9e5cf3951f83f8722f32db0ee1544764')


package() {
  cd "$pkgname-$pkgver"
  install -Dm644 lib/*.jar -t"$pkgdir/usr/share/java/$pkgname/"
  install -dm755 "$pkgdir/usr/share/doc"
  cp -a --no-preserve=o apidocs "$pkgdir/usr/share/doc/$pkgname"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
