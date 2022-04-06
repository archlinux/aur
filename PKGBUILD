# Maintainer: 7Ji
# Contributor: alex19ep
pkgname=pacman-beep-hook
pkgver=0.0
pkgrel=1
pkgdesc='hook to play Pac-Man theme using pcspkr before and after any transaction'
arch=(any)
depends=(beep)
source=('pacman-beep-pre.hook' 'pacman-beep-post.hook' 'pacman-beep.sh')
sha256sums=('aded20b0ccf99f68f0be155d8c92cd01eb3582009707011ca12007e047acc055' 'd0b3cfc53d90d648a073bc8a155bab3902c2fa1d52a0cd9b577947388197fd90' 'fe79120d2d63b0f49daddbb15df15cae693cdf582cb9ade139e6256cadec2e1a')
package() {
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[0]}
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[1]}
    install -Dm0755 -t "$pkgdir/usr/bin/" ${source[2]}
}
