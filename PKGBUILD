pkgname=mfcoin-cli-bin
pkgver=0.8.0
pkgrel=0
provides=('mfcoin' 'mfcoin-daemon')
conflicts=('mfcoin-cli-git' 'mfcoin-cli')
pkgdesc="MFCoin is a digital currency and blockchain service platform."
arch=('x86_64')
depends=("libevent>=2.1.8" "miniupnpc>=2.0.20170509" "libdb-4.8")
url="https://mfcoin.net/"
license=('GPL3')

source_x86_64=(
    "https://github.com/MFrcoin/MFCoin/releases/download/v.${pkgver}.${pkgrel}/mfcoin-${pkgver}-linux.zip"
)
sha256sums_x86_64=(
    'bc71c94d74465569ce387401240944165704733ce7a0b66bf2349b6e3d9db0f9'
)

package() {
    mkdir -p "$pkgdir"/usr/bin
    cp "$srcdir"/mfcoind "$pkgdir"/usr/bin
    cp "$srcdir"/mfcoin-cli "$pkgdir"/usr/bin
}

