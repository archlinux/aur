pkgname=openjazz-bin
pkgver=20240919
pkgrel=1
pkgdesc="Jazz jackrabbit 1 Reimplimentation engine."
url="https://gitlab.com/linuxbombay/openjazz"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
depends=('sdl2' 'sdl2_net')
sha256sums_i686=('eddc6483508154f126afd85e445b9acc7971f5fbbcd79754660dccde871db438')
sha256sums_x86_64=('360b8108890c5b966faea73d7f92be9e33888c7cd5a24205a6d2cea14b581122')
sha256sums_aarch64=('f0758edeaae6146342008ed740a9393bf8e561910ed2a2949c55041f6770bb15')
source_i686=("openjazz-$pkgver-linux-i686.tar.xz::$url/binaries/$pkgver/-/raw/main/openJazz-linux-i686.tar.xz")
source_x86_64=("openjazz-$pkgver-linux-x64.tar.xz::$url/binaries/$pkgver/-/raw/main/openJazz-linux-x64.tar.xz")
source_aarch64=("openjazz-$pkgver-linux-arm64.tar.xz::$url/binaries/$pkgver/-/raw/main/openJazz-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    cp -r "$srcdir/OpenJazz" "$pkgdir/usr/bin/openjazz"
}
