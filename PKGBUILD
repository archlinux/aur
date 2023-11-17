# Maintainer: Phr33d0m <archlinux at ne-davam.info>

pkgname=sshed-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Visual cross-platform editor created to manage list of SSH hosts in ssh config file"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/trntv/sshed"
license=('Apache')
source_x86_64=("https://github.com/trntv/sshed/releases/download/$pkgver/sshed_${pkgver}_linux_amd64.tar.gz")
source_i686=("https://github.com/trntv/sshed/releases/download/$pkgver/sshed_${pkgver}_linux_386.tar.gz")
source_armv6h=("https://github.com/trntv/sshed/releases/download/$pkgver/sshed_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("https://github.com/trntv/sshed/releases/download/$pkgver/sshed_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('2a2671ba7b5462a557660d21a863cb565ffe79a53bab124bb4b1cd84b1d8c164')
sha256sums_i686=('da5a1a44f642f725ef7b6dcded48d5510241e8e404e9d15efc2e513e797804fb')
sha256sums_armv6h=('5c4fcd5c128e8f04bcd01f01b6665c9f61dabe825cc1c13b4e2b5dfc9ecfb3ad')
sha256sums_armv7h=('213fbeb9c04d08c40c32065f60cc5a82b547b20cc5bfeddc569ee3f34e26ae79')

package() {
    cd "$srcdir"
    install -Dm755 sshed "$pkgdir/usr/bin/sshed"
}
