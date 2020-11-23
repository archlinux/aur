# Maintainer: Patrik Sundberg <patrik.sundberg at gmail dot com>

pkgname=motivewave
pkgver=6.3.1
pkgrel=1
pkgdesc="MotiveWave for Linux"
arch=('x86_64')
url="https://www.motivewave.com"
source=("https://www.motivewave.com/update/download.do?file_type=LINUX")
sha512sums=('8d34fa55eb7b194926ff21307cda70ad5004a484dc266fb22144a69f4d5d414c75ff417632e2097aa6063efa3ee32544ee931849fa3e758381ec18c22b377048')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"
	chmod 755 "$pkgdir/usr/bin/motivewave"
}
