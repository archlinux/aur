# Maintainer: Teoh Han Hui <teohhanhui@gmail.com>

pkgname=aniadd-bin
pkgver=04.06.14
pkgrel=1
pkgdesc='A very simple to use AniDB client (GUI)'
arch=('any')
url='https://anidb.net/perl-bin/animedb.pl?show=software'
license=('unknown')
depends=('java-runtime')

DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

source=('https://static.anidb.net/files/AniAdd.jar'
        'aniadd.sh')
noextract=('AniAdd.jar')
sha256sums=('19fbfec796de1c381797969cd085468e21cb8c41bdb67ee18f02a825ee08af6f'
            'SKIP')

package() {
    install -D -m 644 AniAdd.jar "$pkgdir"/usr/share/java/aniadd/AniAdd.jar
    install -D -m 755 aniadd.sh "$pkgdir"/usr/bin/aniadd
}
