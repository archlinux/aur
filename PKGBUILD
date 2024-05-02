pkgname=nyaa-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="A tui tool for browsing and downloading torrents from nyaa.si"
url='https://github.com/Beastwick18/nyaa/'
source_x86_64=("$pkgname-$pkgver::https://github.com/Beastwick18/nyaa/releases/download/v$pkgver/nyaa-$pkgver-x86_64-unknown-linux-gnu")
# source_aarch64=("")
# source_armv7h=("")
# arch=('x86_64' 'aarch64' 'armv7h')
arch=('x86_64')
license=('GPL-3.0-or-later')
# depends=('git' 'pacman' 'libalpm.so>=14-64')
conflicts=('nyaa')
provides=('nyaa')
b2sums_x86_64=('f00ae927247d079c970ca1602024e606fcb435eb455649613c618f6c9134e463442d427e3eb775f9289451d802d8c7a6a32fec8d5afed27327880e433e8decca')

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
