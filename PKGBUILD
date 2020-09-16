# Maintainer: Kevin Schoon <kevinschoon@gmail.com>
pkgname=note-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="Simple Note Taking CLI"
url="https://github.com/kevinschoon/note"
arch=(x86_64)
license=('AGPL3')
source=("note-glibc-0.5.5.tar.gz::https://github.com/kevinschoon/note/releases/download/0.5.5/note-glibc-0.5.5.tar.gz")
md5sums=(2f6d427e6e7fb732bbc5863e7b2ea38e)

package() {
	install -Dm755 usr/bin/note -t "${pkgdir}/usr/bin/"
	install -Dm644 usr/share/bash-completion/completions/note -t ${pkgdir}/usr/share/bash-completion/completions/
	install -Dm644 usr/share/man/man7/note.7.gz -t ${pkgdir}/usr/share/man/man7/
}
