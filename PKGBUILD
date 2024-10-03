pkgname=haptic-bin
pkgver=v0.2.0.beta
pkgrel=1
pkgdesc="Open-Source markdown editor - your new home for notes"
arch=('x86_64')
url="https://github.com/chroxify/haptic"
license=("GNU Affero General Public License v3.0")
source_x86_64=("https://github.com/chroxify/haptic/releases/download/v0.2.0-beta/haptic_0.1.4_amd64.deb")
sha256sums_x86_64=('4c3ccaa81823f5659143dece5f04e82318c021ec65bd33a9cbf06de5c9ee16ff')
depends=('webkit2gtk')
provides=('haptic')
confilcts=()

package() {
  tar -xvf 'data.tar.gz' -C "${pkgdir}"
  cd "$pkgdir/usr/share/applications/"
  patch --forward --strip=1 --input=../../../../../desktop.patch
}
