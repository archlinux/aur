# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.8.19
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    armv6h) _pkgarch="armv6"
	sha256sums=('af7e5b72a193babd31cc3c9d31810dcc37106ae434d4dd32b61e0efa8aeb1c1b')
           ;;
    x86_64) _pkgarch="x86_64"
	sha256sums=('96e711534b6c6a3918a888ce44e52226c79318fec5e0353e6e43d8a3f508cdf0')
           ;;
    armv64h) _pkgarch="arm64"
	sha256sums=('f4e89aa592e6a280f3bb5012ab729d3788ac1567ca725b758215ff68f7a735db')
           ;;
    i686) _pkgarch="i386"
	sha256sums=('7d52157eb021e0514ed953f1e0122caaa506b76232a85e26b91b82ab0563216d')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
