# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=compressonator-cli-bin
pkgver=4.0.4836
# this is different to the linux bin version for some reason
release_name=V4.0.4855
pkgrel=1
pkgdesc="CLI for GPU texture compression, decompression, format transcoding, and more"
arch=('any')
url="https://github.com/GPUOpen-Tools/Compressonator"
license=('MIT')
depends=()
optdepends=()
makedepends=()
source=("$url/releases/download/$release_name/Compressonator_Linux_x86_64_$pkgver.tar.gz"
        "CompressonatorCLI")
sha256sums=('11a520464e3274faa68d455420e2ea404fa68029a340fcb9c8145926c0407a75'
            '145c3cf7eef00b28bcda80d1d5a677420ab76d34cf5e8c01ae435af204531fcc')
backup=()

package() {
  mkdir -p "$pkgdir"/usr/lib/compressonator-cli-bin
  mkdir "$pkgdir"/usr/bin
  cp CompressonatorCLI "$pkgdir"/usr/bin/
  cp -r "Compressonator_Linux_x86_64_$pkgver"/* "$pkgdir"/usr/lib/compressonator-cli-bin/
}
