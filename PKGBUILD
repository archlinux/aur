# Maintainer: Patrik Sundberg <patrik.sundberg at gmail dot com>

pkgname=motivewave
pkgver=6.3.0
pkgrel=1
pkgdesc="MotiveWave for Linux"
arch=('x86_64')
url="https://www.motivewave.com"
source=("https://www.motivewave.com/update/download.do?file_type=LINUX")
sha512sums=('9d27f0eb279db7bfe413aef105d4a095a1b40aadde401892d2a5e5829d7aa352794bd4f8914854763c5c70c57feed6e53dc0fe0e54c3573350f7c746c0c7770d')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "$pkgdir/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"
	chmod 755 "$pkgdir/usr/bin/motivewave"
}
