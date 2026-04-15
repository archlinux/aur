pkgname=lune-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Lune CLI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/gentij/lune"
license=('MIT')
conflicts=('lune' 'lune-bin')
source=("https://github.com/gentij/lune/releases/download/v1.0.0/lune_linux_amd64.tar.gz")
sha256sums=('d3b06eb2e3944b85e520098bb37ee9adf5727da6a2f8c00238671344356c4eef')

package() {
  install -Dm755 "${srcdir}/lune" "${pkgdir}/usr/bin/lune"
}
