# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=wakatime-cli-bin
pkgver=1.45.3
pkgrel=1
provides=('wakatime' 'wakatime-cli')
conflicts=('wakatime' 'wakatime-cli')
pkgdesc='Command line interface used by all WakaTime text editor plugins.'
arch=('x86_64')
url='https://github.com/wakatime/wakatime-cli'
license=('BSD')
source=("wakatime-${pkgver}-${pkgrel}.zip::https://github.com/wakatime/wakatime-cli/releases/download/v$pkgver/wakatime-cli-linux-amd64.zip"
	"LICENSE-${pkgver}-${pkgrel}::https://raw.githubusercontent.com/wakatime/wakatime-cli/v$pkgver/LICENSE")
sha256sums=('SKIP' 'SKIP')

package() {
	install -Dm755 wakatime-cli-linux-amd64 "$pkgdir/usr/bin/wakatime"
	install -Dm644 LICENSE-${pkgver}-${pkgrel} "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
