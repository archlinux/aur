# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rav1e-bin
pkgver=0.6.5
pkgrel=1
pkgdesc="The fastest and safest AV1 encoder"
arch=('x86_64' 'aarch64')
url="https://github.com/xiph/rav1e"
license=('BSD' 'custom')
provides=("rav1e=$pkgver")
conflicts=('rav1e')
source=("https://raw.githubusercontent.com/xiph/rav1e/master/LICENSE"
        "https://raw.githubusercontent.com/xiph/rav1e/master/PATENTS")
source_x86_64=("https://github.com/xiph/rav1e/releases/download/v$pkgver/rav1e-$pkgver-linux-sse4.tar.gz")
source_aarch64=("https://github.com/xiph/rav1e/releases/download/v$pkgver/rav1e-$pkgver-linux-aarch64.tar.gz")
sha256sums=('SKIP'
            'SKIP')
sha256sums_x86_64=('290f94a0a2fcdffafcdaff5be493f302b7dd58c271e31bfe34d5f8f9151fc1b3')
sha256sums_aarch64=('1655fb219978cca50e4bd6a52679253d75b26f742ea0362bb151faa856f32d05')


package() {
  install -Dm755 "$srcdir/rav1e" -t "$pkgdir/usr/bin"
  install -Dm644 {LICENSE,PATENTS} -t "$pkgdir/usr/share/licenses/rav1e"
}
