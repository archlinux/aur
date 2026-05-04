# Maintainer: VanHoney-ltd <stygionevidencesystems@gmail.com>
pkgname=ionguard-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Real-time LAN device monitor with dark UI — NEMESIS ENGINE (prebuilt binary)"
arch=('x86_64')
url="https://github.com/VanHoney-ltd/ionguard"
license=('MIT')
depends=('gtk3' 'webkit2gtk' 'fping')
optdepends=('fping: for active network sweeps')
provides=('ionguard')
conflicts=('ionguard')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/ionguard-$pkgver-linux-amd64.tar.gz")
sha256sums=('a731b6803e819a4d8bf2c4ef0aa5bc40d17bc397c76529dd31453c799041bd63')

package() {
    cd "$srcdir"
    install -Dm755 ionguard "$pkgdir/usr/bin/ionguard"
    install -Dm755 ionguard-core "$pkgdir/usr/bin/ionguard-core"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
