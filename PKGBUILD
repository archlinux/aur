# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=compressonator-cli-bin
pkgver=3.2.535
pkgrel=1
pkgdesc="CLI for GPU texture compression, decompression, format transcoding, and more"
arch=('any')
url="https://github.com/GPUOpen-Tools/Compressonator"
license=('MIT')
depends=()
optdepends=()
makedepends=()
source=("$url/releases/download/v3.2.4691/Compressonator_Linux_x86_64_$pkgver.tar.gz"
        "CompressonatorCLI")
sha256sums=('6662b363cba0a57532557f24742d06d33f8d51caed374c3d4aa7ddf1a74ec64d'
            '145c3cf7eef00b28bcda80d1d5a677420ab76d34cf5e8c01ae435af204531fcc')
backup=()

package() {
  mkdir -p "$pkgdir"/usr/lib/compressonator-cli-bin
  mkdir "$pkgdir"/usr/bin
  cp CompressonatorCLI "$pkgdir"/usr/bin/
  cp -r "Compressonator_Linux_x86_64_$pkgver"/* "$pkgdir"/usr/lib/compressonator-cli-bin/
}
