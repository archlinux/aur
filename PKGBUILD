# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=xsos
pkgver=0.7.19
pkgrel=1
pkgdesc="Summarize system info from sosreports"
arch=('any')
url="https://github.com/ryran/xsos"
license=('GPL3')
depends=('bash' 'gawk' 'sed')
optdepends=('dmidecode: for bios info'
            'ethtool: for network interface data')
source=("https://github.com/ryran/xsos/archive/v${pkgver}.tar.gz")
md5sums=('ea78cc2c54df57293f3c44cdc3b65868')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 xsos "$pkgdir/usr/bin/xsos"
    install -Dm644 xsos-bash-completion.bash \
        "${pkgdir}/usr/share/bash-completion/completions/xsos"
}
