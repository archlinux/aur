# Maintainer: MopigamesYT <mopigames@proton.me>
pkgname=hytale-rpc-rs-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Discord Rich Presence for Hytale - written in Rust (prebuilt binary)"
arch=('x86_64')
url="https://github.com/MopigamesYT/hytale-rpc-rs"
license=('GPL3')
depends=('dbus')
provides=('hytale-rpc-rs')
conflicts=('hytale-rpc-rs' 'hytale-rpc-rs-git')
source=("${pkgname}-${pkgver}::https://github.com/MopigamesYT/hytale-rpc-rs/releases/download/v${pkgver}/hytale-rpc-linux-x86_64")
sha256sums=('SKIP')

package() {
    install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/hytale-rpc"
}
