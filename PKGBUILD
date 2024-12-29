# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>

pkgname=ttf-pending-mono
pkgver=0.0.3
pkgrel=1
pkgdesc="A composite font of BIZ UD Gothic and Commit Mono"
arch=(any)
url="https://github.com/yuru7/pending-mono"
license=(custom:SIL)
source=("$url/releases/download/v$pkgver/PendingMono_v$pkgver.zip"
        "$url/releases/download/v$pkgver/PendingMonoNF_v$pkgver.zip"
        "$url/releases/download/v$pkgver/PendingMonoJPDOC_v$pkgver.zip"
        "$url/releases/download/v$pkgver/PendingMonoHW_v$pkgver.zip"
        "$url/releases/download/v$pkgver/PendingMonoHWNF_v$pkgver.zip"
        "$url/releases/download/v$pkgver/PendingMonoHWJPDOC_v$pkgver.zip"
        "https://raw.githubusercontent.com/yuru7/pending-mono/v$pkgver/LICENSE")
sha256sums=('b673a17307bc3f7662a78ecda3d289e9b8fbe3642553890c3d917d9caee21cb8'
            '5639fac7ab8c4a981c725cfc959e4763f4f1df11ad85baaa4d15df99a050d8e4'
            'b4bcd53ea5647db93ee539ea08cc3225618ae7d8f5984dbb4795ef85e5fb3b07'
            '9c800020e6b04098e5abcadc411287fdae009d712aa6eb411beb8ffefc53dbc7'
            '3ca0274e3067336b6522665d0d7475fe6f41f07d21e016e88c2ab044aab255e5'
            'fd5a53ae410ccd28fbe4b554d4bb683c6de37ad794aa7dbeb6d721ac0dd9625e'
            '03be85d01384bf68cb682f9f4f81c3e99e37b943270cf2bdca2c1cabec6f31ce')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 PendingMono_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 PendingMonoNF_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 PendingMonoJPDOC_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 PendingMonoHW_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 PendingMonoHWNF_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 PendingMonoHWJPDOC_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
