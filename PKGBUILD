# Maintainer: Your Name <your.email@example.com>
pkgname=encrypter
pkgver=1.2.8
pkgrel=1
pkgdesc="Dosya ve klasör şifreleme uygulaması"
arch=('any')
url="https://gitlab.com/saydut/encrypter"
license=('GPL3')
depends=('python' 'tk' 'python-cryptography')
source=("git+https://gitlab.com/saydut/encrypter.git#branch=master")
md5sums=('SKIP')

package() {
  cd "$srcdir/encrypter"
  install -Dm755 encrypter.py "$pkgdir/usr/bin/encrypter"
  install -Dm644 encryption-app.desktop "$pkgdir/usr/share/applications/encryption-app.desktop"
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/icon.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/encrypter/LICENSE"
}
