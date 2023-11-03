# Maintainer: blek! <me@blek.codes>
pkgname=bfile-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='The blek! File CLI'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://git.blek.codes/blek/bfile_cli'
license=('GPL3')
provides=('bfile-cli')
conflicts=('bfile-cli')

source_x86_64=("https://git.blek.codes/blek/bfile_cli/releases/download/${pkgver}/bfile_cli.linux.amd64")
source_aarch64=("https://git.blek.codes/blek/bfile_cli/releases/download/${pkgver}/bfile_cli.linux.arm64")
source_armv7h=("https://git.blek.codes/blek/bfile_cli/releases/download/${pkgver}/bfile_cli.linux.arm")

sha256sums_x86_64=('f97daa8dddc4a173c34a4b3d4d48a7e2955bec1e24c92d642c3dad356d54fbf8')
sha256sums_aarch64=('c22c58de4a57351b12a24ca76e0ccaab3172894c80ffd840159dd21d8ca2d28f')
sha256sums_armv7h=('95fca3137acd8439b88424175acfb87f7bd1052b55672f3e676c619dd306c7bc')

package() {
	binfile=$(find . -name "bfile_cli.linux.*")
	install -Dm755 "${binfile}" "${pkgdir}/usr/bin/bfile_cli"
}
