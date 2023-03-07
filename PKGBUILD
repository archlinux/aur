pkgname=plotter
pkgver=0.0.1
pkgrel=0
pkgdesc="Command line utility for stylish interactive charts"
arch=('x86_64' 'i686')
url="https://github.com/termapps/plotter"
license=("MIT")
provides=("plotter")
source_x86_64=(plotter-0.0.1.zip::https://github.com/termapps/plotter/releases/download/v0.0.1/plotter-v0.0.1-x86_64-unknown-linux-gnu.zip)
source_i686=(plotter-0.0.1.zip::https://github.com/termapps/plotter/releases/download/v0.0.1/plotter-v0.0.1-i686-unknown-linux-gnu.zip)
sha256sums_x86_64=("8584ba3993c3caa14ba82f6faf191c4fea3bc078890be6c45bf91f9d19573985")
sha256sums_i686=("2feb53dea0983a2bd54ac7b040555903ebf6947fbd902f12b9697524fac59cbd")

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
