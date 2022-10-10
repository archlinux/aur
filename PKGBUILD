pkgname="plsplay"
pkgver="0.1.0"
pkgrel=1
pkgdesc="A command line audio player."
arch=("x86_64")
url="https://github.com/El-Wumbus/plsplay"
license=("GPL2")
provides=("plsplay")
source=("https://github.com/El-Wumbus/plsplay/releases/download/v${pkgver}-alpha/plsplay_v${pkgver}-alpha_x86_64-linux.tar.xz")
sha256sums=("95192691a65c3bfc8e5197f8e049dda5dc03ee1e5174b053ffe2031e880021f0")

package()
{
    cd target/release
    install -Dm755 ./plsplay "$pkgdir/usr/bin/plsplay"
}