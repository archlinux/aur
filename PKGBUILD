# Maintainer:  gĩtahi<opl.to/gth>
pkgname=twitter-cli
pkgver=0.11.0
pkgrel=1
pkgdesc="Tweet without going to twitter.com"
arch=('x86_64')
url="https://github.com/StanleyMasinde/twitter"
license=('MIT')
provides=('twitter-cli')
conflicts=('twitter-cli')
depends=('glibc')
source=("https://github.com/StanleyMasinde/twitter/releases/latest/download/twitter-linux-gnu.tar.gz")
sha256sums=('e128093ee3aa327ea582e6c1d1fcff1d39c883ffa273bdb1f4128314f564eecd')

package() {
  cd "${srcdir}"
  install -Dm755 "twitter" "${pkgdir}/usr/local/bin/twitter-cli"
}
