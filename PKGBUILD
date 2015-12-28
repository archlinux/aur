# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=xsos
pkgver=0.7.5
pkgrel=4
pkgdesc="Summarize system info from sosreports"
arch=('any')
url="https://github.com/ryran/xsos"
license=('GPL3')
depends=('bash' 'gawk' 'sed')
optdepends=('dmidecode: for bios info'
            'ethtool: for network interface data')
source=("https://github.com/ryran/xsos/archive/v0.7.5.tar.gz")
md5sums=('aed40721ef9cf9c6c74664285edf857d')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 xsos "$pkgdir/usr/bin/xsos"
    install -Dm644 xsos-bash-completion.bash \
        "${pkgdir}/usr/share/bash-completion/completions/xsos"
}
