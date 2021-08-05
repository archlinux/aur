# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=wakatime-cli-bin
pkgver=1.18.9
pkgrel=1
provides=('wakatime' 'wakatime-cli')
conflicts=('wakatime' 'wakatime-cli')
pkgdesc='Command line interface used by all WakaTime text editor plugins.'
arch=('x86_64')
url='https://github.com/wakatime/wakatime-cli'
license=('BSD')
source=("https://github.com/wakatime/wakatime-cli/releases/download/v$pkgver/wakatime-cli-linux-amd64.zip"
        "https://raw.githubusercontent.com/wakatime/wakatime-cli/v$pkgver/LICENSE")
sha256sums=('5c9e1f6a0d6ca72fbf22e661672c6abffd36341be8c2927c6cc83e4038c786ca'
            '4aafe64159ef6372aba2de60ba7de1b92cb37c9adc63f904ae1a0e4e7b1292d2')

package() {
    install -Dm755 wakatime-cli-linux-amd64 "$pkgdir/usr/bin/wakatime"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
