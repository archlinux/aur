# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=itop
_debpkgver=0.1-4_amd64
pkgver=0.1
pkgrel=2
pkgdesc="Simple interrupt monitor top-like way"
arch=('x86_64')
url="http://www.hunz.org/"
license=('custom')
depends=('glibc')
conflicts=('itop-git')
source=("ftp://ftp.it.debian.org/debian/pool/main/i/itop/itop_$_debpkgver.deb")
sha256sums=('ff6a5b04bca9ce18548cf1a3d403757c4d7305d848ab28bbea068f19e4d64f57')

package() {
 cd "$srcdir"
  bsdtar xf data.tar.gz -C "$pkgdir"
}
