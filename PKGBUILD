# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=srcom-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="X compositor - fork by infraflakes"
arch=('x86_64')
url="https://github.com/infraflakes/srcom"
license=('MIT' 'MPL-2.0')
depends=('glibc' 'libepoxy' 'libev' 'libx11' 'libxcb' 'pcre2' 'pixman' 'xcb-util' 'xcb-util-renderutil')
makedepends=()
provides=('srcom')
conflicts=('srcom')
source=(
    "https://github.com/infraflakes/srcom/releases/download/v$pkgver/srcom-v$pkgver-linux-amd64"
    "https://raw.githubusercontent.com/infraflakes/srcom/refs/heads/main/LICENSES/MIT"
)
sha256sums=('559c7d991a8c9857d203f74694ea9212aa53d7ba2f129ca698e3a7246b91c464'
'fd80a26fbb3f644af1fa994134446702932968519797227e07a1368dea80f0bc')

package() {
    install -Dm755 "srcom-v$pkgver-linux-amd64" "$pkgdir/usr/bin/srcom"
    install -Dm644 "MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
