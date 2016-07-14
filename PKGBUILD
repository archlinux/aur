# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=xsos
pkgver=0.7.8
pkgrel=1
pkgdesc="Summarize system info from sosreports"
arch=('any')
url="https://github.com/ryran/xsos"
license=('GPL3')
depends=('bash' 'gawk' 'sed')
optdepends=('dmidecode: for bios info'
            'ethtool: for network interface data')
source=("https://github.com/ryran/xsos/archive/v${pkgver}.tar.gz")
md5sums=('c51f85958019dfd3c17bf64dc12f5fe1')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 xsos "$pkgdir/usr/bin/xsos"
    install -Dm644 xsos-bash-completion.bash \
        "${pkgdir}/usr/share/bash-completion/completions/xsos"
}
