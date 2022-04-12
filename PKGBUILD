# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=lbrynet-bin
pkgver=0.108.0
pkgrel=1
pkgdesc='Implementation of the LBRY Network protocols, without the desktop app'
arch=('x86_64')
url='https://lbry.tech/'
license=('MIT')
conflicts=('lbrynet' 'lbry-app-bin>=0.47.1' 'lbry-app-bin<0.47.2-2')
provides=("lbrynet=$pkgver")
source=("lbrynet-linux-$pkgver.zip::https://github.com/lbryio/lbry-sdk/releases/download/v$pkgver/lbrynet-linux.zip"
        "lbrynet-LICENSE-$pkgver::https://raw.githubusercontent.com/lbryio/lbry-sdk/v$pkgver/LICENSE")

package() {
   install -Dm755 "${srcdir}/lbrynet" -t "${pkgdir}/usr/bin/"
   install -Dm644 "${srcdir}/lbrynet-LICENSE-$pkgver" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
b2sums=('2e9fc64890efade9c185784b33dae567d97b5978b792298742373af79206d308540e3f1642ad46c7ddb6c973fa6671f6ea32db3c8bc8d484bd3ecbead6c380db'
        'c17e30091ae9d3f6ad3f5a70c80ff686bdcbfc41b9b603d5693c34a006aba635968ebc67aa5ddeb607053b098ad8d3d3a03b790249ab58b9cbb6f66ba6cf5693')
