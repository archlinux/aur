# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=dt-cli-bin
pkgver=0.7.4
pkgrel=1
epoch=
pkgdesc="\$HOME, \$HOME everywhere"
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
    "dt-cli-v$pkgver-x86_64::https://github.com/blurgyy/dt/releases/download/v$pkgver/dt-cli-v$pkgver-x86_64"
    "${_license_base}-APACHE"
    "${_license_base}-MIT"
)
source_aarch64=(
    "dt-cli-v$pkgver-aarch64::https://github.com/blurgyy/dt/releases/download/v$pkgver/dt-cli-v$pkgver-aarch64"
    "${_license_base}-APACHE"
    "${_license_base}-MIT"
)
source_armv7=(
    "dt-cli-v$pkgver-armv7::https://github.com/blurgyy/dt/releases/download/v$pkgver/dt-cli-v$pkgver-armv7"
    "${_license_base}-APACHE"
    "${_license_base}-MIT"
)
# Sources are the same for armv7l and armv7h
source_armv7l=("${source_armv7[@]}")
source_armv7h=("${source_armv7[@]}")

## Checksums
b2sums_aarch64=(
    "e48b32e2bbf827bde2f9cd32231025afcad897078d943a8af89cc3f4157ef8aa87b7321e5cd6e183428cf51ec46483e373a8217e5f3916a2209215d21f053c0d"
    "d25ee5b67e1fa998ccfbfa42034beb939bf05d02fd4487fe30631522e89a96d32134a6331e5d72f235418aefa34d2559db222ddb35bb9f2758f01388d74e55d8"
    "c9785cc556ad8d3296623c42aa1e6c296f241f8279986eaf2b774579b0ba5c20c4970209387164dcc06da47b37b0cb0c1c0c88f96e3dfca9bc299bd861c06213"
)
b2sums_armv7=(
    "0343353afd6b62bd318e07965dae76c2c0834cbf0a4fa9e684a50543a690bdc229eb53b71e473c9a0a528eac42786a9de8e22fef6987f96d7bb1258775edccb9"
    "d25ee5b67e1fa998ccfbfa42034beb939bf05d02fd4487fe30631522e89a96d32134a6331e5d72f235418aefa34d2559db222ddb35bb9f2758f01388d74e55d8"
    "c9785cc556ad8d3296623c42aa1e6c296f241f8279986eaf2b774579b0ba5c20c4970209387164dcc06da47b37b0cb0c1c0c88f96e3dfca9bc299bd861c06213"
)
b2sums_x86_64=(
    "ea72a9fdb5fc962f32d6c16765afb878df39f09318e60368922a8ebb2bd1c07129eec7f6a8ee37a927aab01a503ccfea18be0ec5835e15010d1122a8682ec1b2"
    "d25ee5b67e1fa998ccfbfa42034beb939bf05d02fd4487fe30631522e89a96d32134a6331e5d72f235418aefa34d2559db222ddb35bb9f2758f01388d74e55d8"
    "c9785cc556ad8d3296623c42aa1e6c296f241f8279986eaf2b774579b0ba5c20c4970209387164dcc06da47b37b0cb0c1c0c88f96e3dfca9bc299bd861c06213"
)
# Checksums are the same for armv7l and armv7h
sha256sums_armv7l=("${sha256sums_armv7[@]}")
sha256sums_armv7h=("${sha256sums_armv7[@]}")

noextract=()
validpgpkeys=()

## Packaging
package() {
    install -Dm755 dt-cli-$pkgver "$pkgdir/usr/bin/dt-cli"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/dt/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/dt/LICENSE-MIT"
}
