# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.8.30
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    x86_64) _pkgarch="x86_64"
	sha256sums=('6dfbfda3fc8ba93f6def527da4021264d8adab59ea128be5338b91bfe213868b')
           ;;
    armv64h) _pkgarch="arm64"
	sha256sums=('101d91a787dfafcb3139c9410056f005b367020253f91c28c39d34aea118a160')
           ;;
    i686) _pkgarch="i386"
	sha256sums=('50312deb75840275c15a9663b7c709291071d8044deae7a1c2816a7711bcf090')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
