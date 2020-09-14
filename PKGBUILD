# Maintainer: Kevin Schoon <kevinschoon@gmail.com>
pkgname=note-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="Simple Note Taking CLI"
url="https://github.com/kevinschoon/note"
arch=(x86_64)
license=('AGPL3')
source=("note-glibc-0.5.4.tar.gz::https://github.com/kevinschoon/note/releases/download/0.5.4/note-glibc-0.5.4.tar.gz")
md5sums=(e1a2b7df553ca3cf9971ce7685bef272)

package() {
	install -Dm755 usr/bin/note -t "${pkgdir}/usr/bin/"
	install -Dm644 usr/share/bash-completion/completions/note -t ${pkgdir}/usr/share/bash-completion/completions/
	install -Dm644 usr/share/man/man7/note.7.gz -t ${pkgdir}/usr/share/man/man7/
}
