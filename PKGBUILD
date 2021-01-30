# Maintainer: Tom Richards <tom@tomrichards.net>
pkgname=rockyou
pkgver=1.2.1
pkgrel=1
pkgdesc='The popular "rockyou" password list from OWASP SecLists project'
arch=('any')
url='https://owasp.org/www-project-seclists/'
license=('CCPL:by-sa')
source=('https://raw.githubusercontent.com/danielmiessler/SecLists/1.2/Passwords/rockyou.txt.tar.gz')
sha256sums=('47c070a029bcdb4cbd0e02c69fed136ef46dce4048ddbadf177daa5e885b8172')

package() {
    install -Dm644 rockyou.txt "$pkgdir"/usr/share/dict/rockyou.txt
}
