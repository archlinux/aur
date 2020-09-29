# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbrynet-bin
pkgver=0.82.0
pkgrel=1
pkgdesc='Implementation of the LBRY Network protocols, without the desktop app'
arch=('x86_64')
url='https://lbry.tech/'
license=('MIT')
conflicts=('lbrynet' 'lbry-app-bin>=0.47.1' 'lbry-app-bin<0.47.2-2')
provides=('lbrynet')
source=("https://github.com/lbryio/lbry-sdk/releases/download/v$pkgver/lbrynet-linux.zip"
        'lbrynet-LICENSE::https://raw.githubusercontent.com/lbryio/lbry-sdk/master/LICENSE')

package() {
   install -Dm755 "${srcdir}/lbrynet" -t "${pkgdir}/usr/bin/"
   install -Dm644 "${srcdir}/lbrynet-LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
b2sums=('78dc3d87e4f8d187c4b0d8dae0d8f396aafb7abdce9fb16b0ef3d98e7b5e9315bb1380b22dad4e975458822a74d3c1fab448f06e1dae48284f96c5bbf91359ff'
        'c17e30091ae9d3f6ad3f5a70c80ff686bdcbfc41b9b603d5693c34a006aba635968ebc67aa5ddeb607053b098ad8d3d3a03b790249ab58b9cbb6f66ba6cf5693')
