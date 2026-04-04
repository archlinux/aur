pkgname=tunnelops
pkgver=1.0.0
pkgrel=1
pkgdesc="Interactive SSH tunnel and file transfer manager built with Bash"
arch=('any')
url="https://github.com/rdarshan927/tunnelops"
license=('AGPL3')
depends=('bash' 'openssh')
optdepends=('sshpass: for password authentication' 'cronie: for cron support')
source=("git+https://github.com/rdarshan927/tunnelops.git")
md5sums=('SKIP')

package() {
    cd "$srcdir/tunnelops"

    install -Dm755 tunnel.sh "$pkgdir/usr/bin/tunnelops"
}
