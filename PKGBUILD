# Maintainer: Sauyon Lee <sauyon@setsuna>
pkgname=ampinstmgr
pkgver=2.4.2
pkgrel=1
epoch=
pkgdesc="AMP (Application Management Panel) is a simple to use and easy to install control panel and management system for hosting game servers."
arch=('i686' 'x86_64')
url="https://cubecoders.com/AMP"
license=(unknown)
groups=()
depends=(lib32-glibc lib32-gcc-libs tmux socat dnsutils jq qrencode)
makedepends=()
checkdepends=()
optdepends=(jre8-openjdk-headless jre-openjdk-headless)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://repo.cubecoders.com/$pkgname-$pkgver.x86_64.tgz")
sha256sums=('18005b8fb9696d746d150b58aafec7c125c6e52c8e3adcf871db7200c5b53901')

noextract=()

package() {
  cd "$srcdir/"

  cp -r . "$pkgdir/"
  rm "$pkgdir/$pkgname-$pkgver.x86_64.tgz"
}

# vim:set ts=2 sw=2 et:
