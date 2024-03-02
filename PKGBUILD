# Maintainer: A. Benz <hello@benz.dev>
pkgname=bmv-bin
pkgver=0.0.1
pkgrel=1
pkgdesc='bulk-rename files from stdin'
url='https://github.com/abenz1267/bmv'
source_x86_64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_${pkgver}_linux_arm64.tar.gz")
arch=('x86_64' 'aarch64')
conflicts=('bmv')
provides=('bmv')
sha256sums_x86_64=('c32f020a65f249ca8fb69846dd4c7a29903c1aa273bfd56fa851395feaa9b26e')
sha256sums_aarch64=('4d5d3256aecfcc5e77b9225c188f9aa03faf69d0a73c44b926aeb96ebe017be4')

package() {
  cd "$srcdir/"

  install -Dm755 bmv "${pkgdir}/usr/bin/bmv"
}
