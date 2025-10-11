# Maintainer:  gĩtahi<opl.to/gth>
pkgname=twitter-cli
pkgver=1.0.0
pkgrel=3
pkgdesc="Tweet without going to twitter.com"
arch=('x86_64')
url="https://github.com/StanleyMasinde/twitter"
license=('MIT')
provides=('twitter-cli')
conflicts=('twitter-cli')
depends=('glibc')
source=("$url/releases/download/v$pkgver/twitter-linux-x86_64.tar.gz")
sha256sums=('abff0488814620a977a50caa71a207396c016a4ad25f3fe7851c16de12bd9415')

package() {
  cd "${srcdir}"
  install -Dm755 "twitter" "${pkgdir}/usr/local/bin/twitter-cli"
  ln -s /usr/local/bin/twitter-cli "${pkgdir}/usr/local/bin/twitter"
}
