pkgname=easy-config
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple CLI tool to quickly open and edit configuration files"
arch=('any')
url="https://github.com/keegang6705/EasyConfig"
license=('MIT')
depends=()
optdepends=('fzf: for interactive selection'
            'fd: for faster file searching')
source=("cf.sh" "config.ini" "LICENSE")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 cf.sh "$pkgdir/usr/local/bin/cf"
    install -Dm644 config.ini "$pkgdir/etc/easy-config/config.ini"
    install -Dm444 config.ini "$pkgdir/usr/share/easy-config/config.ini.default"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
