# Maintainer: mityada <mityada@gmail.com>
pkgname=eporezi
pkgver=1.2.2_7
pkgrel=1
arch=('any')
url="https://github.com/OpenSerbianEID/ePorezi"
depends=('java-runtime-openjdk=8')
optdepends=('safesignidentityclient: for Posta certificates')
source=("https://github.com/OpenSerbianEID/ePorezi/releases/download/${pkgver/_/-}/ePorezi.zip"
        "eporezi")
sha256sums=('24812da708bad0a1730d608a28e6bc1308f26695ffaea7dfca2c42c984df23fe'
            'c465368cc358d675972c3e045b4eb0cf7e40030322627809d3f64a8c2e049df7')

package() {
    cd "$srcdir"

    install -Dm755 "eporezi" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "ePorezi.app/Contents/Resources/Java/ePorezi.jar" "$pkgdir/usr/share/java/$pkgname/ePorezi.jar"
}
