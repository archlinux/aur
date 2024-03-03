# Maintainer: A. Benz <hello@benz.dev>
pkgname=bmv-bin
license=('MIT')
pkgver=0.0.7
pkgrel=1
pkgdesc='bulk-rename files from stdin'
url='https://github.com/abenz1267/bmv'
source_x86_64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/abenz1267/bmv/releases/download/v$pkgver/bmv_${pkgver}_linux_arm64.tar.gz")
arch=('x86_64' 'aarch64')
conflicts=('bmv')
provides=('bmv')
sha256sums_x86_64=('05bcca00236f788bee349797a43ce672f492862c07d1012cb5fe9042d4013ac4')
sha256sums_aarch64=('0b24a28f6d1d347d51611d01f1dc7abce114e6d94b9c7a2e273ec8dce0fb7a1b')

package() {
  cd "$srcdir/"

  install -Dm755 bmv "${pkgdir}/usr/bin/bmv"
}
