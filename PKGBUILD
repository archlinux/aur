# Contributor: maz-1 <ohmygod19993 at gmail dot com>

pkgname=obs-service-verify_file
pkgver=20151031
pkgrel=1
pkgdesc='An OBS source service to verify file'
arch=('any')
url='https://github.com/openSUSE/'
license=('GPL2')
depends=('obs-build' 'git')
source=("http://download.opensuse.org/source/distribution/13.2/repo/oss/suse/src/obs-service-verify_file-0.1-12.1.2.src.rpm")
sha256sums=('SKIP')

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir/usr/lib/obs/service/"
  install -m755 verify_file "$pkgdir/usr/lib/obs/service/"
  install -m644 verify_file.service "$pkgdir/usr/lib/obs/service/"

}


