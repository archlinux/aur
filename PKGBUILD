# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=dt-cli-bin
pkgver=0.7.8
pkgrel=1
epoch=
pkgdesc="Dotfile management and templating client"
arch=("x86_64" "aarch64" "armv7l" "armv7h")
url="https://dt.cli.rs"
license=('MIT OR Apache 2.0')
groups=()
depends=()
makedepends=(
    curl
)
checkdepends=()
optdepends=()
provides=("dt-cli")
conflicts=("dt-cli" "dt-cli-git")
replaces=()
backup=()
options=()
install=
changelog=

## Sources
_license_base="https://raw.githubusercontent.com/blurgyy/dt/v$pkgver/LICENSE"
source_x86_64=(
    "dt-cli-v$pkgver-$arch::https://github.com/blurgyy/dt/releases/download/v$pkgver/dt-cli-v$pkgver-x86_64"
    "${_license_base}-APACHE"
    "${_license_base}-MIT"
)
source_aarch64=(
    "dt-cli-v$pkgver-$arch::https://github.com/blurgyy/dt/releases/download/v$pkgver/dt-cli-v$pkgver-aarch64"
    "${_license_base}-APACHE"
    "${_license_base}-MIT"
)
source_armv7=(
    "dt-cli-v$pkgver-$arch::https://github.com/blurgyy/dt/releases/download/v$pkgver/dt-cli-v$pkgver-armv7"
    "${_license_base}-APACHE"
    "${_license_base}-MIT"
)
# Sources are the same for armv7l and armv7h
source_armv7l=("${source_armv7[@]}")
source_armv7h=("${source_armv7[@]}")

## Checksums
b2sums_aarch64=(
    "e0da93e93e529b3f87c568126eb2a5d649c279b747574cd01437917921090ef8a162da7068a2e5f1c21c8d31450db93845b06aadeeaf699fe2ec7012031a303b"
    "d25ee5b67e1fa998ccfbfa42034beb939bf05d02fd4487fe30631522e89a96d32134a6331e5d72f235418aefa34d2559db222ddb35bb9f2758f01388d74e55d8"
    "c9785cc556ad8d3296623c42aa1e6c296f241f8279986eaf2b774579b0ba5c20c4970209387164dcc06da47b37b0cb0c1c0c88f96e3dfca9bc299bd861c06213"
)
b2sums_armv7=(
    "5e896b319ac8dc765b8511b50668959ef2eed801e6e4aef7e43a733e32c0634c0c3304f86dc25efd2b71c4df49161a35ee90c84fb5543f119c341c865b6b96e5"
    "d25ee5b67e1fa998ccfbfa42034beb939bf05d02fd4487fe30631522e89a96d32134a6331e5d72f235418aefa34d2559db222ddb35bb9f2758f01388d74e55d8"
    "c9785cc556ad8d3296623c42aa1e6c296f241f8279986eaf2b774579b0ba5c20c4970209387164dcc06da47b37b0cb0c1c0c88f96e3dfca9bc299bd861c06213"
)
b2sums_x86_64=(
    "790c49ede9c7cd20b241b4db4b707f5111b53a9bbc47b44cf921860185d7c5ff9b271fcb2a3b6123cb2600bdbcc78f06c844938ddd52b803b42eb5df5fe09848"
    "d25ee5b67e1fa998ccfbfa42034beb939bf05d02fd4487fe30631522e89a96d32134a6331e5d72f235418aefa34d2559db222ddb35bb9f2758f01388d74e55d8"
    "c9785cc556ad8d3296623c42aa1e6c296f241f8279986eaf2b774579b0ba5c20c4970209387164dcc06da47b37b0cb0c1c0c88f96e3dfca9bc299bd861c06213"
)
# Checksums are the same for armv7l and armv7h
b2sums_armv7l=("${b2sums_armv7[@]}")
b2sums_armv7h=("${b2sums_armv7[@]}")

noextract=()
validpgpkeys=()

## Packaging
package() {
    install -Dm755 "dt-cli-v$pkgver-$arch" "$pkgdir/usr/bin/dt-cli"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/dt/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/dt/LICENSE-MIT"
}
