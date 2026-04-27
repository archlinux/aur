pkgname=lunie-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Lunie CLI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/gentij/lunie"
license=('MIT')
conflicts=('lunie' 'lunie-bin')
source=("https://github.com/gentij/lunie/releases/download/v1.0.0/lunie_linux_amd64.tar.gz")
sha256sums=('73f513e0e131063de033e313151a24f1b00e86e98539fecee5f0e9fea4694554')

package() {
  install -Dm755 "${srcdir}/lunie" "${pkgdir}/usr/bin/lunie"
}
