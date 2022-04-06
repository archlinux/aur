# Maintainer: 7Ji
# Contributor: alex19ep
pkgname=pacman-beep-hook
pkgver=0.0
pkgrel=2
pkgdesc='hook to play Pac-Man theme using pcspkr before and after any transaction'
arch=(any)
depends=(beep)
source=('pacman-beep-pre.hook' 'pacman-beep-post.hook' 'pacman-beep.sh')
sha256sums=('1077b23b7af3c7f14a798c3f79e8e50a3833666dc1be1fe03b13523f1dbd8ff5' '51a39193564ed70b0dc60c895548d68324f10d4d75a8a514828cf2be28ed21ac' 'fe79120d2d63b0f49daddbb15df15cae693cdf582cb9ade139e6256cadec2e1a')
package() {
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[0]}
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[1]}
    install -Dm0755 -t "$pkgdir/usr/bin/" ${source[2]}
}
