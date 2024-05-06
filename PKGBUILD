# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: steeltitanium <steeltitanium1 at gmail dot com>

pkgname=ringracers-data
pkgver=2.2
pkgrel=1
pkgdesc="Data files for Dr. Robotnik's Ring Racers"
arch=('any')
license=('custom')
url='https://www.kartkrew.org'
source=("https://github.com/KartKrewDev/RingRacers/releases/download/v$pkgver/Dr.Robotnik.s-Ring-Racers-v$pkgver-Assets.zip")
sha256sums=('a7d62effb76c64819c9f6678e3151799ef4dbf7488e51241147a9dcf301b8736')

package() {
	mkdir -p "$pkgdir"/usr/share/games/RingRacers/data
	cp -r models "$pkgdir"/usr/share/games/RingRacers/models
	install -m644 data/*.pk3 "$pkgdir"/usr/share/games/RingRacers/data
	install -m644 bios.pk3 models.dat "$pkgdir"/usr/share/games/RingRacers
	install -Dm644 PASSWORDS.txt "$pkgdir"/usr/share/doc/ringracers/PASSWORDS.txt
}
