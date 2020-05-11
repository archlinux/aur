pkgname=gram-wallet-bin
pkgver=0.9.8
pkgrel=1
provides=('gram-wallet')
conflicts=('gram-wallet' 'gram-wallet-git')
pkgdesc="Desktop Gram Wallet"
arch=('x86_64')
depends=()
url="https://github.com/ton-blockchain/wallet-desktop"
license=('GPL3')

source_x86_64=(
    "https://github.com/ton-blockchain/wallet-desktop/releases/download/v$pkgver/wsetup.$pkgver.tar.xz"
)

sha256sums_x86_64=(
    '8ab1c7523c12e93b9d9fc5e50bea741af3a04a1e1482ded236e4219702edccba'
)

package() {
    mkdir -p $pkgdir/usr/bin
    cp Wallet/Wallet $pkgdir/usr/bin/gram-wallet
}
