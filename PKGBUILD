# Maintainer: Enrique <1enrique3@protonmail.com>

pkgname=rokit-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Next-generation toolchain manager for Roblox projects."
arch=('x86_64' 'aarch64')
url="https://github.com/rojo-rbx/rokit"
license=('MIT')
source_x86_64=("https://github.com/rojo-rbx/rokit/releases/download/v$pkgver/rokit-$pkgver-linux-x86_64.zip")
source_aarch64=("https://github.com/rojo-rbx/rokit/releases/download/v$pkgver/rokit-$pkgver-linux-aarch64.zip")
sha512sums_x86_64=('bf88c03c13c4b63b8d9a641182c885cb5ca0aae60e62eade02d994e48ca52d6c6c81a17b4c334b32a958facf555a7ef6fcf83a7b421aaa6bde576fcde8c54915')
sha512sums_aarch64=('7449f4d113f2e69c18627f3b5cd76d11674604147fb4e1fe270b686e53ca3af814fc27993d337d7dce045028a97ad6bd1e564ac2cc893296c1865f75c5bff6e5')

package() {
	install -Dm755 rokit "$pkgdir/usr/bin/rokit"
}
