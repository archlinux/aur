# Maintainer: Khalid Alansary <khaled.ansary2003@outlook.com>
pkgname=tofu-ls-bin
pkgver='0.1.1'
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
sha256sums_aarch64=('3b2d9d6c0a990a4bf786369d4c7f0ddc75466ba22e9e2a7378df2de0fffffd8f')
sha256sums_i386=('76138e92f0fd94cbbe2e0127a4cc0e572e1b8f320c31d0715dfb1848fff16d72')
sha256sums_x86_64=('38a94ef14446403a3ebd4deb2da7d5e6f5e067a177f573dd2ee8830e0b2d034f')

package(){
		install -Dm755 tofu-ls "$pkgdir/usr/bin/tofu-ls"
}
