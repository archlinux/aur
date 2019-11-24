pkgname=gram-wallet-bin
pkgver=0.9.4
pkgrel=1
provides=('gram-wallet')
conflicts=('gram-wallet' 'gram-wallet-git')
pkgdesc="Desktop Gram Wallet"
arch=('x86_64')
depends=()
url="https://github.com/ton-blockchain/wallet-desktop"
license=('GPL3')

source_x86_64=(
    "https://github.com/ton-blockchain/wallet-desktop/releases/download/v0.9.4/wsetup.0.9.4.tar.xz"
)

sha256sums_x86_64=(
    '6cc7b2eeb9d4ed219905c1227e3f7f25bdce36c714d45b538bd4bc626bc6d12b'
)

package() {
    mkdir -p $pkgdir/usr/bin
    cp Wallet/Wallet $pkgdir/usr/bin/gram-wallet
}
