# Maintainer: tuxxx <nzb_tuxxx@proton.me>

pkgname=nzb-monkey-go-bin
pkgver=0.1.19
pkgrel=2
pkgdesc="NZBLNK-URI handler supporting SABnzbd, NZBGet & Synology DS (Go-based)"
arch=('x86_64')
url="https://github.com/Tensai75/nzb-monkey-go"
license=('MIT')
depends=('glibc')
provides=("nzb-monkey-go")
conflicts=("nzb-monkey-go-git" "nzb-monkey-go")

source=(
    "${url}/releases/download/v${pkgver}/nzb-monkey-go_v${pkgver}-linux-amd64.zip"
    "com.github.tensai75.nzb-monkey-go.desktop"
)
sha256sums=(
    'e2443941b72417ef99d36d9ab4cd902c112fedad95bd79d0774f7af8653b2462'
    'dbf841f7241af6719283123df580f798f7bb27a8f26a28b3af1f64ed7e50a395'
)

package() {
    install -Dm755 "nzb-monkey-go" "$pkgdir/usr/bin/nzb-monkey-go"
    install -Dm644 "com.github.tensai75.nzb-monkey-go.desktop" \
        "$pkgdir/usr/share/applications/com.github.tensai75.nzb-monkey-go.desktop"
}