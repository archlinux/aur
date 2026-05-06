# Maintainer: Khalid Alansary <khaled.ansary2003@outlook.com>
pkgname=tofu-ls-bin
pkgver='0.4.2'
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
sha256sums_aarch64=('c6c05e2ab3c4b6580c51e3f742d648966bd6854209d5eb33843b1f052906d435')
sha256sums_i386=('ceec774fd877bb58699529ca5eb011aed1a80aefa65207992188b19456ce4df5')
sha256sums_x86_64=('81d6906db0ca8ed05b8f62b832e97ce2d7dea0292c18d9b8f01c7521da021876')

package(){
		install -Dm755 tofu-ls "$pkgdir/usr/bin/tofu-ls"
}
