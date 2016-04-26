# Maintainer: Herbert Knapp <herbert.knapp at edu.uni-graz.at>
pkgname=atvrec
pkgver=1.0.2
pkgrel=1
pkgdesc="Tiny TV recorder for Austrian TV stations ORF, ATV, Puls4, ServusTV Mediathek and ORF livestreams"
arch=('x86_64')
url="https://twitter.com/hmknapp"
license=('Freeware')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://www.dropbox.com/s/fkwiu7kcpf8jjsf/$pkgname-$pkgver.tar.gz?dl=1")
md5sums=('890c2d217b7ecfb2c83de7ac0c14f720')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install $pkgname "$pkgdir/usr/bin/"
}
