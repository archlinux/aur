# Maintainer :  Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)


pkgname=videolan-backgrounds-base

pkgver=2
pkgrel=1

pkgdesc='VideoLAN branded wallpapers (rpm package by Jean-Paul Saman)'
arch=('any')
url='https://www.videolan.org/goodies.html#wallpaper'
license=('GPL')

changelog=CHANGELOG
source=("https://images.videolan.org/images/backup/$pkgname-$pkgver-$pkgrel.noarch.rpm")
sha256sums=('6e94a405328f2fcf66f025be1ab604a6c518f1b89dfd10f13dda217780b6e1c6')


package() { install -Dm644 usr/share/backgrounds/images/* -t"$pkgdir/usr/share/backgrounds/videolan/"; }


# vim: ts=2 sw=2 et ft=PKGBUILD:
