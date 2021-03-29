# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=big-yotta
pkgver=5.3
pkgrel=1
pkgdesc='Sequencing.com utility for uploading large genetic data files'
arch=(x86_64)
url='https://sequencing.com/big-yotta-dna-genome-file-uploader'
license=('custom:big-yotta')
source=('https://sequencing.com/sites/default/files/big-yotta-rpm-v5_3.rpm')
sha256sums=('42c30b857891f8443dae24e22826f8bc244ef6d93bbe0d6c7d8d5d5a20a6e6ce')

package() {
	cp -r opt "$pkgdir"
	install -Dm644 opt/BigYotta/BigYotta.desktop "$pkgdir/usr/share/applications/BigYotta.desktop"
}
