# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=dt-cli-bin
pkgver=0.7.7
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
    "0a17ea932819b2fc99692baa0c87b85a118f75ed46e3bed9bd50413937ba5435f47f63c275982eb7ccbc3ea20d15d80bfa604afbe72661295b24366b556d3439"
    "d25ee5b67e1fa998ccfbfa42034beb939bf05d02fd4487fe30631522e89a96d32134a6331e5d72f235418aefa34d2559db222ddb35bb9f2758f01388d74e55d8"
    "c9785cc556ad8d3296623c42aa1e6c296f241f8279986eaf2b774579b0ba5c20c4970209387164dcc06da47b37b0cb0c1c0c88f96e3dfca9bc299bd861c06213"
)
b2sums_armv7=(
    "8745b11b8b8e207fecd81dc47ffd21b66e8e42f260419759f38ba689a755a1df2303e2651e5be8f7a0c196ed3f61a4c6005e58080beef49992290a4df5fa277c"
    "d25ee5b67e1fa998ccfbfa42034beb939bf05d02fd4487fe30631522e89a96d32134a6331e5d72f235418aefa34d2559db222ddb35bb9f2758f01388d74e55d8"
    "c9785cc556ad8d3296623c42aa1e6c296f241f8279986eaf2b774579b0ba5c20c4970209387164dcc06da47b37b0cb0c1c0c88f96e3dfca9bc299bd861c06213"
)
b2sums_x86_64=(
    "52a595b576513d0ab9dc4299dea7c473e2dd39181a2807238caecce1b554396813ec2abb768a7ab6489a55b801b6c7bf28a4a86f7122e388b723cc72783f9edd"
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
