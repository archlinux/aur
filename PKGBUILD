# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: steeltitanium <steeltitanium1 at gmail dot com>

pkgname=ringracers-data
pkgver=2.0
pkgrel=1
pkgdesc="Data files for Dr. Robotnik's Ring Racers"
arch=('any')
license=('custom')
url='https://www.kartkrew.org'
source=("https://github.com/KartKrewDev/RingRacers/releases/download/v$pkgver/Dr.Robotnik.s-Ring-Racers-v$pkgver-Assets.zip")
sha256sums=('a1cff06cf197fc1e94e6dc1c47b0e240e532dee7c65480fa8a923d1fc46fa5ba')

package() {
	mkdir -p "$pkgdir"/usr/share/games/RingRacers/data
	cp -r models "$pkgdir"/usr/share/games/RingRacers/models
	install -m644 data/*.pk3 "$pkgdir"/usr/share/games/RingRacers/data
	install -m644 bios.pk3 models.dat "$pkgdir"/usr/share/games/RingRacers
}
