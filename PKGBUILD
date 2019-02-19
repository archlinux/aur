# Maintainer: ber532k <ber532k@gmx.de>

pkgname=tmux-xpanes
pkgver=3.1.1
pkgrel=1
pkgdesc='Create multiple panes with ultimate terminal divider.'
arch=('any')
url='https://github.com/greymd/tmux-xpanes'
depends=('tmux')
license=('MIT')
source=("https://github.com/greymd/tmux-xpanes/archive/v$pkgver.tar.gz")
md5sums=('118f5dcb798149b2f1c844987e513887')

package() {
    install -D -m 755 "$srcdir/tmux-xpanes-$pkgver/bin/xpanes" "$pkgdir/usr/bin/xpanes"
    install -D -m 755 "$srcdir/tmux-xpanes-$pkgver/bin/tmux-xpanes" "$pkgdir/usr/bin/tmux-xpanes"
    install -D -m 644 "$srcdir/tmux-xpanes-$pkgver/man/xpanes.1" "$pkgdir/usr/share/man/man1/xpanes.1.gz"
    install -D -m 644 "$srcdir/tmux-xpanes-$pkgver/man/tmux-xpanes.1" "$pkgdir/usr/share/man/man1/tmux-xpanes.1.gz"
}
