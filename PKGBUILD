# Maintainer: Khalid Alansary <khaled.ansary2003@outlook.com>
pkgname=tofu-ls-bin
pkgver='0.5.2'
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
sha256sums_aarch64=('2713d5a4606aa7967322bfbacf2cea1f05447085289fd6c68e7aca7b04645106')
sha256sums_i386=('570264ff84427bb4d2c831644e6bc3fde98cb7ee58ec0f2b5af6c56c3bfb35a8')
sha256sums_x86_64=('71e3c0b527e6f87dac188dae49f555d17714d9418dfa2a8e3b472f9170ed31ae')

package(){
		install -Dm755 tofu-ls "$pkgdir/usr/bin/tofu-ls"
}
