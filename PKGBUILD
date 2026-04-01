pkgname=easy-config
pkgver=1.0.2
pkgrel=1
pkgdesc="Simple CLI tool to quickly open and edit configuration files"
arch=('any')
url="https://github.com/keegang6705/EasyConfig"
license=('MIT')
depends=()
optdepends=('fzf: for interactive selection'
            'fd: for faster file searching')
source=("cf.sh" "cf-setup.sh" "config.conf" "LICENSE")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 cf.sh "$pkgdir/usr/local/bin/cf"
    install -Dm755 cf-setup.sh "$pkgdir/usr/local/bin/cf-setup"
    install -Dm644 config.conf "$pkgdir/etc/easy-config/config.conf"
    install -Dm444 config.conf "$pkgdir/usr/share/easy-config/config.conf.default"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
