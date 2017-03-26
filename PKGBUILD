pkgname=spotifyd-bin
pkgver=8d1809f9710e3af4cda7
pkgrel=1
#arch=('armv7h' 'x86_64')
arch=('armv7h')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
#source_x86_64=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-${pkgver}/spotifyd-2017-02-18-amd64.zip" "spotifyd@.service")
#md5sums_x86_64=('61dc585dd3c4581900e7a8191822c791' 'deb315535d8d0c00a4e5698057e4e546')
md5sums_armv7h=('9adadc8a9e8aeee88d017a00db3f1280'
                '230939d3dfe5986ed3587050955b2926')
source_armv7h=("https://github.com/Spotifyd/spotifyd/releases/download/untagged-${pkgver}/spotifyd-2017-02-18-armv7.zip" "spotifyd@.service")

package() {
    install -D -m 755 spotifyd "${pkgdir}/usr/bin/spotifyd"
    install -D -m644 "${srcdir}/spotifyd@.service" "${pkgdir}/usr/lib/systemd/system/spotifyd@.service"
}
