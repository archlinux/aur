pkgname=openjazz-bin
pkgver=20260301
pkgrel=2
pkgdesc="Jazz jackrabbit 1 Reimplimentation engine."
url="https://gitlab.com/linuxbombay/openjazz"
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('sdl3' 'sdl_net')
sha256sums_x86_64=('0b9a15c52f55d89d2e7ecc70e823acfdb9338ac81bded74c3f608ec05b66828f')
sha256sums_aarch64=('a5f5c8f6d144e91098d8c389762719a6bba29067b4362fd579b993ec0f9dedec')
source_x86_64=("openjazz-$pkgver-linux-x64.tar.xz::$url/binaries/$pkgver/-/raw/main/openJazz-linux-x64.tar.xz")
source_aarch64=("openjazz-$pkgver-linux-arm64.tar.xz::$url/binaries/$pkgver/-/raw/main/openJazz-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    cp -r "$srcdir/OpenJazz" "$pkgdir/usr/bin/openjazz"
}
