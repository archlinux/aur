# Maintainer: Takumi <dGFrdW9oQHR1dGEuaW8K | base64 -d>
pkgname=ttf-bizter
pkgver=0.0.1
pkgrel=1
pkgdesc="BIZTER is a composite font of the UI font Inter and the universal design font BIZ UDP Gothic."
arch=("any")
url="https://github.com/yuru7/BIZTER"
license=('OFL-1.1')
source=("$url/releases/download/v$pkgver/${url##*/}_v$pkgver.zip"
        "$url/raw/refs/tags/v$pkgver/LICENSE")

sha256sums=('8194937cb8672953b76f4451a13d8f9ab74fb482320455bb5aa5612f4dafa52d'
            '5e03b2862836119af96d3572f0345d70067a2fd224fab73124359d70cb0f1eba')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 ${url##*/}_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
