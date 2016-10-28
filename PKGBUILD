# Maintainer: David Matson <gitcoder at outlook dot com>
pkgname=freeswitch-sounds-en-us-8000
_pkgnamelong=freeswitch-sounds-en-us-callie-8000
pkgver=1.0.51
pkgrel=1
pkgdesc='8KHz US English prompts for FreeSWITCH'
arch=('any')
url='https://freeswitch.org/'
license=('custom:none')
options=('!strip')
source=("https://files.freeswitch.org/releases/sounds/$_pkgnamelong-$pkgver.tar.gz")
sha256sums=('e48a63bd69e6253d294ce43a941d603b02467feb5d92ee57a536ccc5f849a4a8')

package() {
  for f in $(find . -type f); do
    install -D -m644 "${srcdir}/$f" "${pkgdir}/usr/share/freeswitch/sounds/$f"
  done
}
