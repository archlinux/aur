# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbrynet-bin
pkgver=0.81.0
pkgrel=2
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
b2sums=('bc14b11c09b0502490b5a4d17bcdb597b5603541f402458a30ca7df3e594c60e871fb855ce583421b22cc468124bb281c20803e9784f0b0e0ad6fccbbf358d47'
        'c17e30091ae9d3f6ad3f5a70c80ff686bdcbfc41b9b603d5693c34a006aba635968ebc67aa5ddeb607053b098ad8d3d3a03b790249ab58b9cbb6f66ba6cf5693')
