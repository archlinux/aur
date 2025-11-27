# Maintainer: Khalid Alansary <khaled.ansary2003@outlook.com>
pkgname=tofu-ls-bin
pkgver='0.3.0'
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
sha256sums_aarch64=('ec9f6a30d6c2416ef5e4aacc9ea429744ec34515261ef8a7251878ca5558d721')
sha256sums_i386=('68f66cf7c3309723bcc3cb677ff89eb7ebc740da4194914c6ec4058946d52781')
sha256sums_x86_64=('056f666bc028b2242db3164ab224d8f8fb6f821b0244eb0edec6c1c2169d89e1')

package(){
		install -Dm755 tofu-ls "$pkgdir/usr/bin/tofu-ls"
}
