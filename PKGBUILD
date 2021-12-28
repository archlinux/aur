# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=wakatime-cli-bin
pkgver=1.30.5
pkgrel=1
provides=('wakatime' 'wakatime-cli')
conflicts=('wakatime' 'wakatime-cli')
pkgdesc='Command line interface used by all WakaTime text editor plugins.'
arch=('x86_64')
url='https://github.com/wakatime/wakatime-cli'
license=('BSD')
source=("wakatime-${pkgver}-${pkgrel}.zip::https://github.com/wakatime/wakatime-cli/releases/download/v$pkgver/wakatime-cli-linux-amd64.zip"
        "LICENSE-${pkgver}-${pkgrel}::https://raw.githubusercontent.com/wakatime/wakatime-cli/v$pkgver/LICENSE")
sha256sums=('b10fbafb78d665c318757e41a9928b69cd4801a0782f8556c45663383313780b'
            '4aafe64159ef6372aba2de60ba7de1b92cb37c9adc63f904ae1a0e4e7b1292d2')

package() {
    install -Dm755 wakatime-cli-linux-amd64 "$pkgdir/usr/bin/wakatime"
    install -Dm644 LICENSE-${pkgver}-${pkgrel} "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
