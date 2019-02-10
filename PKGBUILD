# Contributor: Antti Hautaniemi <an7oine at me com>

pkgname=vhs.sh
pkgver=1.4.5
pkgrel=1
pkgdesc="Areena- ja Ruutu-sisällön nauhoitusskripti"
arch=('any')
url="https://github.com/an7oine/vhs"
license=('MIT')
depends=('bash' 'php' 'curl' 'libxml2' 'jq' 'youtube-dl' 'rtmpdump' 'yle-dl' 'ffmpeg' 'gpac' 'atomicparsley')
source=('https://raw.githubusercontent.com/an7oine/vhs/master/vhs.sh')
md5sums=('SKIP')

package() {
  install -D -m 755 "$srcdir/vhs.sh" "$pkgdir/usr/bin/vhs.sh"
}
