# Maintainer: Hannes Hilbert <calendarsync at hsht dot de>

pkgname=calendarsync-bin
pkgver=0.6.2
pkgrel=1
pkgdesc='Stateless CLI tool to sync calendars across different calendaring systems'
arch=('x86_64')
url='https://github.com/inovex/CalendarSync'
license=('MIT')
provides=('calendarsync')
conflicts=('calendarsync')
options=('!lto')
source=("calendarsync-$pkgver.tar.gz::https://github.com/inovex/CalendarSync/releases/download/v$pkgver/CalendarSync_${pkgver}_linux_amd64.tar.gz")
sha256sums=('750a82f593bb3073ed18d88f27fe7669e218b1d55a8813daea41cabc5d6c15e8')

package() {
    cd "$srcdir/"
    install -Dm755 CalendarSync "$pkgdir/usr/bin/calendarsync"
 }

