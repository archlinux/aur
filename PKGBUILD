# Maintainer: Mehmet Emir Keleş <youremail@example.com>
pkgname=mek-security
pkgver=1.0.0
pkgrel=1
pkgdesc="Security tool for detecting MITM attacks and blocking IP addresses."
arch=('any')
url="https://github.com/MehmetEmirKeles/mek-security-2.0"
license=('MIT')
depends=('bash' 'nmap' 'arp-scan' 'curl')
makedepends=('git')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

package() {
  # repo kökünde "mek-security.sh" varsayılıyor; farklıysa yolu düzenle
  install -Dm755 "$srcdir/$pkgname/mek-security.sh" "$pkgdir/usr/bin/mek-security"
}
