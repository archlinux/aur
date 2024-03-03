# Maintainer: A. Benz <hello@benz.dev>
pkgname=bmv-bin
pkgver=0.0.4
pkgrel=1
pkgdesc='bulk-rename files from stdin'
url='https://github.com/abenz1267/bmv'
source_x86_64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_${pkgver}_linux_arm64.tar.gz")
arch=('x86_64' 'aarch64')
conflicts=('bmv')
provides=('bmv')
sha256sums_x86_64=('d302b4a155c25178ce0efe71f13e900c7cd64be10cf7993a82b66234603be2fc')
sha256sums_aarch64=('b0c00e9617b457e6b0dda6baf7363d364c724d631f2a4deab0dd088d285e85a4')

package() {
  cd "$srcdir/"

  install -Dm755 bmv "${pkgdir}/usr/bin/bmv"
}
