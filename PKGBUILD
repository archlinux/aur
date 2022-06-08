# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=dt-cli-bin
pkgver=0.7.9
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
  "ae48e99efc6a6c1b4dc1e894058909f08925c7bc002a9cf8f086b20f2b71406cb616fadfed00ec367814bf7723c50a0b60592ddf835fdfa0c053f6344199cdc2"
  "d25ee5b67e1fa998ccfbfa42034beb939bf05d02fd4487fe30631522e89a96d32134a6331e5d72f235418aefa34d2559db222ddb35bb9f2758f01388d74e55d8"
  "c9785cc556ad8d3296623c42aa1e6c296f241f8279986eaf2b774579b0ba5c20c4970209387164dcc06da47b37b0cb0c1c0c88f96e3dfca9bc299bd861c06213"
)
b2sums_armv7=(
  "f7944b0e821c0c6765e4872d1008db9d689542c423ee65e315cd780bb5746966f485fbea4bc23b0dd4bf1f98e1f4efb96cedc0ce9cac8f4e7851d83f2efc96c5"
  "d25ee5b67e1fa998ccfbfa42034beb939bf05d02fd4487fe30631522e89a96d32134a6331e5d72f235418aefa34d2559db222ddb35bb9f2758f01388d74e55d8"
  "c9785cc556ad8d3296623c42aa1e6c296f241f8279986eaf2b774579b0ba5c20c4970209387164dcc06da47b37b0cb0c1c0c88f96e3dfca9bc299bd861c06213"
)
b2sums_x86_64=(
  "13aaeb2b17ece66e1c7b0728068eecc37cfee4b5552a124ac749f5828770160edd9ee347abfa47112328f2e6acda12cedbf2e7cc90feabe90a7396a0cc36e19f"
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
