# Maintainer: William Grieshaber <me@zee.li>
# Contributor: Victor Aurélio <victoraur dot santos at gmail dot com>

pkgname=speedtest-cli
pkgver=0.3.2
pkgrel=1
pkgdesc='Command line interface for testing internet bandwidth using speedtest.net'
arch=('any')
url='https://github.com/sivel/speedtest-cli'
license=('Apache')
depends=('python')
source=("https://github.com/sivel/speedtest-cli/archive/v${pkgver}.tar.gz")
sha512sums=('c98a10772f81b4db503483eb675cbdeacac7803c02a6554ee6d075143e93cfed0834ebda2f6ead5f75a169a5840d0789537dc06e1a8829d52ae112d0fc7eba6c')

package(){
    cd "$srcdir/$pkgname-$pkgver"

    install -D -m755 speedtest_cli.py "${pkgdir}/usr/bin/speedtest-cli"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
