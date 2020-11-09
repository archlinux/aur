# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbrynet-bin
pkgver=0.84.0
pkgrel=1
pkgdesc='Implementation of the LBRY Network protocols, without the desktop app'
arch=('x86_64')
url='https://lbry.tech/'
license=('MIT')
conflicts=('lbrynet' 'lbry-app-bin>=0.47.1' 'lbry-app-bin<0.47.2-2')
provides=('lbrynet')
source=("lbrynet-linux-$pkgver.zip::https://github.com/lbryio/lbry-sdk/releases/download/v$pkgver/lbrynet-linux.zip"
        "lbrynet-LICENSE-$pkgver::https://raw.githubusercontent.com/lbryio/lbry-sdk/v$pkgver/LICENSE")

package() {
   install -Dm755 "${srcdir}/lbrynet" -t "${pkgdir}/usr/bin/"
   install -Dm644 "${srcdir}/lbrynet-LICENSE-$pkgver" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
b2sums=('884b8119de5a97ac24db212057f4c162093d8f65ac06a1a85f6c9beb6ea22d10ce3c23a7681eab8adca2b2e22724b624d1bce739d77e60faafebb9e1001aef8e'
        'c17e30091ae9d3f6ad3f5a70c80ff686bdcbfc41b9b603d5693c34a006aba635968ebc67aa5ddeb607053b098ad8d3d3a03b790249ab58b9cbb6f66ba6cf5693')
