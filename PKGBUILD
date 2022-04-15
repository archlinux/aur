# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=dt-cli-bin
pkgver=0.7.8
pkgrel=2
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
    "3ca92b26e2aaf86b8a93c42a6b2513a7cb88872e8fb8e33729e16c791c3fbcff46f4d6fe91e9e72e16f107885bbaec5f7f82d342ded7bde9cfeebf6891b9b313"
    "d25ee5b67e1fa998ccfbfa42034beb939bf05d02fd4487fe30631522e89a96d32134a6331e5d72f235418aefa34d2559db222ddb35bb9f2758f01388d74e55d8"
    "c9785cc556ad8d3296623c42aa1e6c296f241f8279986eaf2b774579b0ba5c20c4970209387164dcc06da47b37b0cb0c1c0c88f96e3dfca9bc299bd861c06213"
)
b2sums_armv7=(
    "fc8236ca05f30ceda13f429384f4899b00e2e80435ed43bb37ba55c751065cdcb67796bdb90de4639de19aecdb7d2cd582b984251f2df06dc8904e243ecd6f82"
    "d25ee5b67e1fa998ccfbfa42034beb939bf05d02fd4487fe30631522e89a96d32134a6331e5d72f235418aefa34d2559db222ddb35bb9f2758f01388d74e55d8"
    "c9785cc556ad8d3296623c42aa1e6c296f241f8279986eaf2b774579b0ba5c20c4970209387164dcc06da47b37b0cb0c1c0c88f96e3dfca9bc299bd861c06213"
)
b2sums_x86_64=(
    "45156d2c2d4d743b48d2f003c31b830bd2072fa3223824381fe91e45009a6018f7a84f9b5512c5fab6a747f08b26a3a61efacc8fd13979700926f87e4f453502"
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
