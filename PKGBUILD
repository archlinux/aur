# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=jing
pkgver=20220510
pkgrel=1
pkgdesc="RELAX NG validator"
url=https://github.com/relaxng/jing-trang
license=(BSD)
arch=(x86_64)
source=("$url/releases/download/V$pkgver/jing-$pkgver.zip"
        jing.sh)
sha256sums=('c1887f5ea6bd90067baafb4cd0d215294781f6fd121b7905c89829d43ea9e280'
            'd7610d8e1446ac837f81bf0726fb7eaa3ed3d6d204bf02eb03f36aabf3ae0c00')
depends=(java-runtime)

package() {
  install -Dm755 jing.sh "$pkgdir"/usr/bin/jing
  install -dm755 "$pkgdir"/usr/share/java/jing/
  install -m644 jing-$pkgver/bin/jing.jar "$pkgdir"/usr/share/java/jing/
}
