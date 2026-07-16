# Maintainer: tee < teeaur at duck dot com >
pkgname=denokv-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="A self-hosted backend for Deno KV, the JavaScript first key-value database"
arch=(x86_64)
url="https://deno.com/kv"
license=(MIT)
provides=(denokv)
conflicts=(denokv)
source=("denokv-$pkgver.zip::https://github.com/denoland/denokv/releases/download/$pkgver/denokv-x86_64-unknown-linux-gnu.zip")
b2sums=('3daca9bb09fd1a2728934c4d38500c4ec3a718f1616158ef89d8bcf2eeb2e5c1490e4d9d3331572f01a00980be6681b10de98c0bac35fc3a5dc28a22c58a5eee')

package() {
    install -Dm755 denokv -t "$pkgdir/usr/bin/"
}
