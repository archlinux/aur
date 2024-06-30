pkgname=nyaa-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="A tui tool for browsing and downloading torrents"
url='https://github.com/Beastwick18/nyaa/'
source_x86_64=("$pkgname-$pkgver::https://github.com/Beastwick18/nyaa/releases/download/v$pkgver/nyaa-$pkgver-x86_64-unknown-linux-gnu")
arch=('x86_64')
license=('GPL-3.0-or-later')
conflicts=('nyaa')
provides=('nyaa')
b2sums_x86_64=('b8ef2bf967d5b3b4ee9ceb21e4599bf311731335ba93773cd0758ae9c9462384e04e5304c6dd625ef2bf2c9f3d3f530df965533357a2a06bd09dafdbae9a2228')

package() {
	cd "$srcdir/"

	install -Dm755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/nyaa"

	# install -Dm644 man/nyaa.8 "$pkgdir/usr/share/man/man8/nyaa.8"
	# install -Dm644 man/nyaa.conf.5 "$pkgdir/usr/share/man/man5/nyaa.conf.5"

	# install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/nyaa.bash"
	# install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/nyaa.fish"
	# install -Dm644 completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_nyaa"

	# cp -r locale "$pkgdir/usr/share/"
}
