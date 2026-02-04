# Maintainer: Gustaf Eden <your-email@example.com>
pkgname=blaeckfetch-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Fast system fetch display for your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/gustafeden/blaeckfetch"
license=('MIT')
provides=('blaeckfetch')
conflicts=('blaeckfetch')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/gustafeden/blaeckfetch/releases/download/v${pkgver}/blaeckfetch-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/gustafeden/blaeckfetch/releases/download/v${pkgver}/blaeckfetch-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('2731e84c2af54f25f2b61ea75ee68732f411be7c763cb0f60bd5cd6774ea62e4')
sha256sums_aarch64=('4bbcfef5d0815de9c254c24d087bb61073ebfcb221f75bf8f093b1e3e451e059')

package() {
    install -Dm755 "${srcdir}/blaeckfetch" "${pkgdir}/usr/bin/blaeckfetch"
}
