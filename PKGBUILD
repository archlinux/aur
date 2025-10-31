# Maintainer: Khalid Alansary <khaled.ansary2003@outlook.com>
pkgname=tofu-ls-bin
pkgver='0.2.0'
pkgrel=1
pkgdesc='OpenTofu Language Server'
arch=('aarch64' 'i386' 'x86_64')
url='https://github.com/opentofu/tofu-ls'
license=('MPL-2.0')
provides=(tofu-ls)
changelog='CHANGELOG.md'
source_aarch64=("https://github.com/opentofu/tofu-ls/releases/download/v$pkgver/tofu-ls_Linux_arm64.tar.gz")
source_i386=("https://github.com/opentofu/tofu-ls/releases/download/v$pkgver/tofu-ls_Linux_i386.tar.gz")
source_x86_64=("https://github.com/opentofu/tofu-ls/releases/download/v$pkgver/tofu-ls_Linux_x86_64.tar.gz")
sha256sums_aarch64=('9d98ab65cb243ca914111d2c5ae524ebb97d8ec742680c304fa0977010b133af')
sha256sums_i386=('d76c29c518bb8d8ea247138731768178af31a0e0c7b48f72543bb425e6be6e31')
sha256sums_x86_64=('cd5de0a1db2c02ab0634e584858233bab0407fa598d0c47b6d915ebeb7c4faac')

package(){
		install -Dm755 tofu-ls "$pkgdir/usr/bin/tofu-ls"
}
