# Maintainer: Kaine Killian kainekillian@proton.me
pkgname=desktopify
pkgver=0.0.1
pkgrel=1
pkgdesc='Reserved name for the upcoming full version of Desktopify'
arch=('any')
url='https://github.com/miniguys/desktopify-lite'
license=('MIT')

prepare() {
  echo "This name is reserved for future use." > README.txt
}

package() {
  install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
}
