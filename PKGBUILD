pkgname=susshi-bin
pkgver=0.15.3
pkgrel=1
pkgdesc='modern, terminal-based SSH connection manager (pre-built binary)'
url='https://github.com/yatoub/susshi'
license=('MIT')
depends=('openssh')
arch=('x86_64')
provides=('susshi')
conflicts=('susshi')
source=("https://github.com/yatoub/susshi/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("susshi-${pkgver}-linux-amd64::https://github.com/yatoub/susshi/releases/download/v${pkgver}/susshi-linux-amd64")
b2sums=(c95eb0b10e8c7e0fd84b95f19f383008c367a152028d1bf8b1d1b6042957c35c65eb24f290bc8908eff4c0227d95194053ff08d21e941e41e4b9864a6ee2cb22)
b2sums_x86_64=(8fa729ca08226090d76db7a6ea870280da7b5f656f7cf0595d184a796e3c50b69e348973356ebf5d1a11ec0f1ec47deed1452e0ee44937fd46749cadfffee7d1)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
