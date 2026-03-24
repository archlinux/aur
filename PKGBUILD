# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=srcom-bin
pkgver=0.0.2
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
sha256sums=(
    'c73672b4c29c4a1475fb5d5cc7aac56143cf34ed7c1b32099df0a73fb9e936a4'
    'fd80a26fbb3f644af1fa994134446702932968519797227e07a1368dea80f0bc'
)

package() {
    install -Dm755 "srcom-v$pkgver-linux-amd64" "$pkgdir/usr/bin/srcom"
    install -Dm644 "MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
