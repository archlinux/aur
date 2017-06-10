pkgname=spotifyd-bin
pkgver=ad661221349c1b7fd273
pkgrel=2
arch=('armv7h' 'x86_64')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-${pkgver}/spotifyd-2017-06-04-amd64.zip" "spotifyd.service")
md5sums_armv7h=('cc27b775bf74b7bcff5d7f5b866afad7'
                'eb95cf4735565e0c596d7e0118fd1e6e')
md5sums_x86_64=('34e9e86b61283db1169c854a3eb07208'
                'eb95cf4735565e0c596d7e0118fd1e6e')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-${pkgver}/spotifyd-2017-06-04-armv7.zip" "spotifyd.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
