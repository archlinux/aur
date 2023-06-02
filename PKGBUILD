# Maintainer: Whois Hoeless <whois@hoeless.com>

pkgname=dcsf-git
pkgver=r14.97092f3
pkgrel=1
pkgdesc="Send attachments / files to DMs with messages in Discord using the dcsf command in your command line. (dcsf = discord send file)"
arch=('any')
url="https://github.com/whois-hoeless/Discord-Console-File-Upload"
license=('MIT')
depends=('python>=3.9' 'git')

source=("git+https://github.com/whois-hoeless/Discord-Console-File-Upload")

sha256sums=('SKIP')
package() {
    cd "$srcdir/Discord-Console-File-Upload"
    install -Dm755 dcsf "$pkgdir/usr/bin/dcsf"
    cd "$srcdir/Discord-Console-File-Upload"
    pip install -r requirements.txt
}
