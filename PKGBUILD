pkgname=publisher
pkgver=0.0.1
pkgrel=0
pkgdesc="Tool to publish & distribute CLI tools"
arch=('x86_64' 'i686')
url="https://github.com/termapps/publisher"
license=("MIT")
provides=("publisher")
source_x86_64=(publisher-0.0.1.zip::https://github.com/termapps/publisher/releases/download/v0.0.1/publisher-v0.0.1-x86_64-unknown-linux-gnu.zip)
source_i686=(publisher-0.0.1.zip::https://github.com/termapps/publisher/releases/download/v0.0.1/publisher-v0.0.1-i686-unknown-linux-gnu.zip)
sha256sums_x86_64=("8433f0bcdef57df32ceb8e4da280d43a65a815534238ac86593b17a036e8f1d3")
sha256sums_i686=("f6e0124dda651829cbfc7040a039212a5347f655e8e7c19073171e95d2a71040")

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
