# Maintainer: MopigamesYT <mopigames@proton.me>
pkgname=hytale-rpc-rs-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Discord Rich Presence for Hytale - written in Rust (prebuilt binary)"
arch=('x86_64')
url="https://github.com/MopigamesYT/hytale-rpc-rs"
license=('GPL3')
depends=('dbus')
provides=('hytale-rpc-rs')
conflicts=('hytale-rpc-rs' 'hytale-rpc-rs-git')
source=("hytale-rpc-${pkgver}::https://github.com/MopigamesYT/hytale-rpc-rs/releases/download/v${pkgver}/hytale-rpc-linux-x86_64")
sha256sums=('dd4bf3a0824914d62c40d6cfb33ed9fd7cd69107598161458084da5245d4ac60')

package() {
    install -Dm755 "hytale-rpc-${pkgver}" "$pkgdir/usr/bin/hytale-rpc"
}
