# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=kr-bin
pkgver=2.4.13
pkgrel=1
pkgdesc="SSH using a key stored in Krypton (binary)"
arch=('x86_64')
url="https://github.com/kryptco/kr"
license=('custom')
provides=('kr')
conflicts=('kr')
source=("https://kryptco.github.io/yum/kr-$pkgver-1.el7.centos.x86_64.rpm"
        "https://github.com/kryptco/kr/blob/$pkgver/LICENSE")

package() {
  install -Dm644 "$srcdir/usr/lib/kr-pkcs11.so" "$pkgdir/usr/lib/kr-pkcs11.so"
  install -Dm755 "$srcdir/usr/bin/kr" "$pkgdir/usr/bin/kr"
  install -Dm755 "$srcdir/usr/bin/krd" "$pkgdir/usr/bin/krd"
  install -Dm755 "$srcdir/usr/bin/krgpg" "$pkgdir/usr/bin/krgpg"
  install -Dm755 "$srcdir/usr/bin/krssh" "$pkgdir/usr/bin/krssh"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('e808ce3dbbe8ba80158c86c9e5b6dcb7834445024cb7f3369c95cdf70d077d6b'
            '6f2395d5afc6d8dbadacb7aa8415089b414ad1e86df5bb070b82ed95e89d808d')
