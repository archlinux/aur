# Contributor: maz-1 <ohmygod19993 at gmail dot com>

pkgname=obs-service-download_url
pkgver=20151031
pkgrel=2
pkgdesc='An OBS source service: curl download tool'
arch=('any')
url='https://github.com/openSUSE/obs-service-download_files'
license=('GPL2')
depends=('obs-build' 'git')
source=("git+https://github.com/hiberis/obs-service-download_url.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  mkdir -p "$pkgdir/usr/lib/obs/service/"
  install -m755 download_url "$pkgdir/usr/lib/obs/service/"
  install -m644 download_url.service "$pkgdir/usr/lib/obs/service/"

}

