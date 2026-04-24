# Maintainer: Khalid Alansary <khaled.ansary2003@outlook.com>
pkgname=tofu-ls-bin
pkgver='0.4.1'
pkgrel=2
pkgdesc='OpenTofu Language Server'
arch=('aarch64' 'i386' 'x86_64')
url='https://github.com/opentofu/tofu-ls'
license=('MPL-2.0')
provides=(tofu-ls)
changelog='CHANGELOG.md'
source_aarch64=("$pkgname-$pkgver-arm64.tar.gz::https://github.com/opentofu/tofu-ls/releases/download/v$pkgver/tofu-ls_Linux_arm64.tar.gz")
source_i386=("$pkgname-$pkgver-i386.tar.gz::https://github.com/opentofu/tofu-ls/releases/download/v$pkgver/tofu-ls_Linux_i386.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/opentofu/tofu-ls/releases/download/v$pkgver/tofu-ls_Linux_x86_64.tar.gz")
sha256sums_aarch64=('7bd503c554db6c85d44344f5bb58ca811909bce518f5d5b70076563d989ac30b')
sha256sums_i386=('33a1ce275793d8967fe601246ffce3f0fbaf109b446d60c0f197ab90fdd93601')
sha256sums_x86_64=('cd95bbf1256a3aac1528fb5914ede4b230fcdc27b476d2a06ba95163d443cc22')

package(){
		install -Dm755 tofu-ls "$pkgdir/usr/bin/tofu-ls"
}
