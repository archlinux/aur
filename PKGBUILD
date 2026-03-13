# Maintainer: Khalid Alansary <khaled.ansary2003@outlook.com>
pkgname=tofu-ls-bin
pkgver='0.4.0'
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
sha256sums_aarch64=('461c95600e15ca2a497e89de27a4232d40a495abc8e2cad0674c2935d0fff726')
sha256sums_i386=('436ed7ba6bfe37eb173fda0b00378ad697de6d97fe6919c4f5954903848b90e6')
sha256sums_x86_64=('6e7fd3fd9f68d1dbea514ff20ca3767b5cbd566b716cef9332487797d771c644')

package(){
		install -Dm755 tofu-ls "$pkgdir/usr/bin/tofu-ls"
}
