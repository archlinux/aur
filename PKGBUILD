# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=compressonator-cli-bin
pkgver=3.1.307
pkgrel=1
pkgdesc="CLI for texture compression, decompression, format transcoding, and more"
arch=('any')
url="https://github.com/GPUOpen-Tools/Compressonator"
license=('MIT')
depends=()
optdepends=()
makedepends=()
source=("$url/releases/download/v3.1.4064/Compressonator_Linux_x86_64_$pkgver.tar.gz"
        "CompressonatorCLI")
sha256sums=('1aba597a1340f622adb25632fc5681034b660f5cf0735408366f7c946a6da38f'
            '145c3cf7eef00b28bcda80d1d5a677420ab76d34cf5e8c01ae435af204531fcc')
backup=()

package() {
  mkdir -p "$pkgdir"/usr/lib/compressonator-cli-bin
  mkdir "$pkgdir"/usr/bin
  cp CompressonatorCLI "$pkgdir"/usr/bin/
  cp -r "Compressonator_Linux_x86_64_$pkgver"/* "$pkgdir"/usr/lib/compressonator-cli-bin/
}
