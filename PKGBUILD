pkgname=glasscalc
pkgver=1
pkgrel=1
pkgdesc="A small script that calculates IVSHMEM device size for Looking Glass"
arch=('i686' 'x86_64' 'armv7h')
url="https://gist.github.com/NeoTheFox/c867fbfcaea74749e96f3006b12675fb"
license=('WTFPL')
depends=('bash' 'bc')
source=(glasscalc.sh::'https://gist.githubusercontent.com/NeoTheFox/c867fbfcaea74749e96f3006b12675fb/raw/d9447400c99edb71b6d654df6b07eda3dbb042ca/glasscalc.sh')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

package() {
  install -Dm755 "glasscalc.sh" "$pkgdir/usr/bin/glasscalc.sh"
}
