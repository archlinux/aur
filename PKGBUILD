# Maintainer: nicknb <nicknb at posteo dot com>
_projectname=enola
pkgname=enola-bin
pkgver=1.0.0
pkgrel=1
arch=("x86_64")
pkgdesc="CLI tool to hunt down social media accounts by username across social networks"
url="https://github.com/TheYahya/enola"
provides=("$_projectname")
conflicts=("$_projectname")
license=("MIT")
source=("$_projectname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_projectname}_${pkgver}_linux_amd64.tar.gz"
        "$_projectname-LICENSE::https://raw.githubusercontent.com/TheYahya/$_projectname/refs/heads/main/LICENSE")
sha256sums=('bbb1cf15b01d56044851cdfcb675c855600c9786aa1193252ca0ac79be79bf0a'
            '3a3f446ecc53d8f0143806ca0b8a32b73611cd28397bab27c3dcb59da06b83e5')

package() {
    install -Dm 0755 enola "$pkgdir/usr/bin/enola"
    install -Dm 0644 $_projectname-LICENSE "$pkgdir/usr/share/licenses/$_projectname/LICENSE"
}
