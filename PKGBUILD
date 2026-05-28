# Maintainer: Khalid Alansary <khaled.ansary2003@outlook.com>
pkgname=tofu-ls-bin
pkgver='0.5.0'
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
sha256sums_aarch64=('1edabd73174098cb882c55e0fb6a4c5ea49abc7c3371125af91fd4f4be4abc87')
sha256sums_i386=('695210988ebf3178201e282724101023ed7505ca9e69f043e57e654773815a62')
sha256sums_x86_64=('bc52de415063dcda3f6f47a3e3794ac03064b8fab52a6c78afdbd36419cc5505')

package(){
		install -Dm755 tofu-ls "$pkgdir/usr/bin/tofu-ls"
}
