# Maintainer: Khalid Alansary <khaled.ansary2003@outlook.com>
pkgname=tofu-ls-bin
pkgver='0.3.1'
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
sha256sums_aarch64=('5ca713a7d15396f37325f2ad7b17a67675848dcd91cd31c00af210a50a5d9465')
sha256sums_i386=('23917dc74771a41838a7547ccd5ca610638286cfba77deec65b80948700862db')
sha256sums_x86_64=('0a712eb101710252a04038d8e79af9a113611a23e840d3e561dab63995d0f49d')

package(){
		install -Dm755 tofu-ls "$pkgdir/usr/bin/tofu-ls"
}
