pkgname=tomat-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="A Pomodoro timer for status bars"
arch=('x86_64' 'aarch64')
url="https://github.com/jolars/tomat"
license=('MIT')
depends=('alsa-lib')
provides=('tomat')
conflicts=('tomat')
source_x86_64=("$url/releases/download/v$pkgver/tomat-x86_64-unknown-linux
-gnu.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/tomat-aarch64-unknown-lin
ux-gnu.tar.gz")
sha256sums_x86_64=('fda55669a0eb05695068a0f13b197bde8186ad1f83b2291a7a60817ffd563a29')
sha256sums_aarch64=('26e8b9a0af963b184f299f89b2924f899b751e2f51da41dfa902fe2d6e99a48e')

package() {
    install -Dm755 tomat "$pkgdir/usr/bin/tomat"
}
