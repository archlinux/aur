pkgname=pd-bin
pkgver=0.1
pkgrel=1
pkgdesc="Perfect Dark Reimplimentation engine."
arch=('x86_64')
_pkgrel_x86_64=1
#_pkgrel_aarch64=1
sha256sums_x86_64=('SKIP')
#sha256sums_aarch64=('SKIP')
source_x86_64=("https://nightly.link/fgsfdsfgs/perfect_dark/workflows/c-cpp/port-net/pd-i686-linux.zip")
#source_aarch64=("https://nightly.link/fgsfdsfgs/perfect_dark/workflows/c-cpp/port-net/pd-i686-linux.zip")
url="https://github.com/fgsfdsfgs/perfect_dark"
license=('GPL')
depends=('lib32-sdl2' 'lib32-alsa-lib' 'lib32-alsa-plugins' 'lib32-pipewire')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/pd" "$pkgdir/usr/bin/pd"
    #ln -s "$srcdir/pd" "$pkgdir/usr/bin"
}
