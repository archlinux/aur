# Maintainer: FineFindus <Finefindusgh@gmail.com>
pkgname=artem-bin
pkgver=2.0.6
pkgrel=1
pkgdesc='Convert images from multiple formats (jpg, png, webp, etc…) to ASCII art, written in rust'
url='https://github.com/finefindus/artem'
license=('MPL2')
arch=('x86_64' 'aarch64')
provides=('artem')
conflicts=('artem')
source=("https://github.com/FineFindus/artem/releases/download/v$pkgver/artem-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz")
sha256sums=('70e19367d6ac8c2077a09dc362d4b11e6f26891265c53c35ee9d491d4d6a9945')

package() {
    install -Dm 755 artem -t "$pkgdir/usr/bin"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 doc/CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 doc/artem.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm 644 completions/artem.bash -t "$pkgdir/usr/share/bash-completion/completions"
	install -Dm 644 completions/artem.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
	install -Dm 644 completions/_artem -t "$pkgdir/usr/share/zsh/site-functions"
}
 