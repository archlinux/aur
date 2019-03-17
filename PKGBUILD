# Maintainer: yurisuki
pkgname=osu-downloader
pkgver=0.0.1
pkgrel=1
pkgdesc="osu! beatmap downloader based on Osu-Masive-Beatmap-Downloader"
arch=('any')
url='https://github.com/GarciaMiguelangel/Osu-Masive-Beatmap-Downloader/'
license=('GPL2')
depends=('jdk-openjdk')
source=( 'osudownloader' )
sha512sums=('b1800380d9c72ab42f17a58e7d783f176d9c6dc1d70f325356e9735c8fb917e73a7078e662b4e21dab5219bae684aab95272d9d2591065b57b323a1b3e622588')

package() {
  install -Dm 755 "$srcdir/osudownloader" "$pkgdir/usr/bin/osudownloader"
}
