# Maintainer: Khalid Alansary <khaled.ansary2003@outlook.com>
pkgname=tofu-ls-bin
pkgver='0.5.3'
pkgrel=1
pkgdesc='OpenTofu Language Server'
arch=('aarch64' 'i386' 'x86_64')
url='https://github.com/opentofu/tofu-ls'
license=('MPL-2.0')
provides=(tofu-ls)
changelog='CHANGELOG.md'
source_aarch64=("$pkgname-$pkgver-arm64.tar.gz::https://github.com/opentofu/tofu-ls/releases/download/v$pkgver/tofu-ls_Linux_arm64.tar.gz")
source_i386=("$pkgname-$pkgver-i386.tar.gz::https://github.com/opentofu/tofu-ls/releases/download/v$pkgver/tofu-ls_Linux_i386.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/opentofu/tofu-ls/releases/download/v$pkgver/tofu-ls_Linux_x86_64.tar.gz")
sha256sums_aarch64=('d30430f86720100e6fc6d16881fcf16bc9e4cb3c4d221fafc1aa992f01387db0')
sha256sums_i386=('b81fabb31d0b17db197a5abfd81f5243ee8b3c1da3bf23929ec7e74c284203a3')
sha256sums_x86_64=('ccf8d85881f493483c9c20ac010d320bf455fdc9dcc39ba0af515206cb488460')

package(){
		install -Dm755 tofu-ls "$pkgdir/usr/bin/tofu-ls"
}
