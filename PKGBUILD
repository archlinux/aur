# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.65.0
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url=https://github.com/ekristen/aws-nuke
license=('MIT')
provides=('aws-nuke')
conflicts=('aws-nuke')
_src="${url}/releases/download/v${pkgver}/aws-nuke-v${pkgver}-linux"
source_x86_64=("$_src"-amd64.tar.gz)
source_aarch64=("$_src"-arm64.tar.gz)
source_armv7h=("$_src"-arm7.tar.gz)
sha256sums_x86_64=('6b9041ce20f5d667a6982f6acf9f8349a26039622a5b29422efa95e65bbe1265')
sha256sums_aarch64=('ad101e7fdc4c5329aa57c027ee59074d86aa5149a5b0d8c2596bfc4aead4cb86')
sha256sums_armv7h=('85ae57ecbadf98d9cac63d7d1482d6f076cae515e56401bda38449a8c0a7b757')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
