# Maintainer: Zain Khan <zai1208@protonmail.com>
pkgname=pwss-fetch-https-git
pkgver=0.1.0
pkgrel=1
pkgdesc="HTTPS resolution for PWSS handles and manifests."
arch=('any')
url="https://github.com/zai1208/pwss-fetch-https"
license=('GPL3')
depends=('curl' 'jq' 'gnupg')
source=("git+https://github.com/zai1208/pwss-fetch-https.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/pwss-fetch-https"
  install -Dm755 pwss-fetch-https "$pkgdir/usr/bin/pwss-fetch-https"
}
