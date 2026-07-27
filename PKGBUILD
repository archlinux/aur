# Maintainer: tee < teeaur at duck dot com >
pkgname=pragtical-bin
pkgver=3.12.4
pkgrel=1
pkgdesc="The practical and pragmatic code editor"
arch=(x86_64)
url="https://pragtical.dev"
license=(MIT)
provides=(pragtical)
conflicts=(pragtical)
depends=(glibc libgcc libstdc++)
source=("https://github.com/pragtical/pragtical/releases/download/v$pkgver/pragtical-v$pkgver-linux-x86_64-portable.tar.gz")
b2sums=('5f6fc829fe26c39c3ae82b79ad52021077621a8dde33d52e91a12b66f7a76e09f8d292a2d1363b86b64e7f190406b9b0fd0e53b1c42d4b8a8719d5454f349334')

package() {
  install -dm755 "$pkgdir/usr/bin" "$pkgdir/opt"
  cp -r --no-preserve=ownership pragtical "$pkgdir/opt/"
  ln -sf /opt/pragtical/pragtical -t "$pkgdir/usr/bin/"
}
