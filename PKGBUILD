# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=rebuild-detector
pkgver=1.2.1
pkgrel=1
pkgdesc="Pacman hook to automatically detect which packages need to be rebuilt"
arch=("any")
license=("MIT")
install="rebuild-detector.install"
source=("rebuild-detector"
        "rebuild-detector.sig"
        "rebuild-detector.hook"
        "rebuild-detector.hook.sig")
sha256sums=('a4678300a04411c74bf7d37a3d56087f3d5427ee7093c0ac75519ac58914d9ba'
            'SKIP'
            'f40d3fbc90c62a7d38795ce1a6600edac3acf2041ea4a4fc987842b6fde5555a'
            'SKIP')
validpgpkeys=("EB4F9E5A60D32232BB52150C12C87A28FEAC6B20")

package() {
    install -Dm755 rebuild-detector -t "$pkgdir/usr/share/libalpm/scripts/"
    install -Dm644 rebuild-detector.hook -t "$pkgdir/usr/share/libalpm/hooks/"
}

# vim:set ts=4 sw=4 et:
