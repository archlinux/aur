# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=rebuild-detector
pkgver=2.0.0
pkgrel=1
pkgdesc="Detects which packages need to be rebuilt"
arch=("any")
license=("MIT")
source=("rebuild-detector"
        "rebuild-detector.sig")
sha256sums=('54fe5370f26e463e74c101df9870c9f716db558cf9e30307ab74e9e4ca0cfbe2'
            'SKIP')
validpgpkeys=("EB4F9E5A60D32232BB52150C12C87A28FEAC6B20")

package() {
    install -Dm755 rebuild-detector -t "$pkgdir/usr/bin/"
}

# vim:set ts=4 sw=4 et:
