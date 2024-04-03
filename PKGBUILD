# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-fenix
pkgver=1.001
pkgrel=3
pkgdesc='Serif font designed for display and long texts'
arch=(any)
url="https://tipotype.com/underground/fenix/"
_commit=4d3753bff382cefeff2925722f8dcff2836b6f62
license=(OFL-1.1-RFN)
source=("https://github.com/google/fonts/raw/$_commit/ofl/fenix/OFL.txt"
        "https://github.com/google/fonts/raw/$_commit/ofl/fenix/Fenix-Regular.ttf")
sha256sums=('8586a7e75681c7297af4cc0641eb2b29e882c5187fe189a1160eceb4e95d4163'
            '5104f5f344f64b5532850b131d7b9e033c112fcfa97dfef00a64c0a40bdae911')

package() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" *.ttf
}
