# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl>

pkgname=mozillajs-linux-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="javascript library used by Oolite"
arch=('x86_64')
url="https://github.com/OoliteProject/mozillajs-linux"
license=('MPL-1.1')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OoliteProject/mozillajs-linux/releases/download/0.0.1/mozilla-js-static-lib.tar.gz"
)
sha512sums=('6b2903570d5d1499d514c6decaed414f567825eeee756c644e49fc67d1ec2b40055321793f8debca00f11da281441b5547d13df4420e5564e7bb27f681f4f4b5')
options=(!strip !debug)


package() {
  mkdir -p "$pkgdir"/usr/{include,lib}
  install -D -m644 include/* "$pkgdir"/usr/include/
  install -D -m644 lib/* "$pkgdir"/usr/lib/
}
