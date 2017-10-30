# Maintainer: Kenny Rasschaert <kenny@kennyrasschaert.com>
# Contributor: Jan Collijs <aur@visibilityspots.com>
pkgname=pipecat-bin
pkgver=0.3
pkgrel=1
pkgdesc="Connect UNIX pipes and message queues"
arch=('i686' 'x86_64')
provides=('pipecat')
url="https://github.com/lukasmartinelli/pipecat"
license=('MIT')
source_i686=("https://github.com/lukasmartinelli/pipecat/releases/download/v${pkgver}/pipecat_linux_386")
source_x86_64=("https://github.com/lukasmartinelli/pipecat/releases/download/v${pkgver}/pipecat_linux_amd64")
source=("https://raw.githubusercontent.com/lukasmartinelli/pipecat/v${pkgver}/LICENSE")
sha1sums_i686=('92cb927336d94d604143a02e8e520e1f54b8d8d5')
sha1sums_x86_64=('a705775f5d4c096556f665fade9d54020ca2b3a0')
sha1sums=('22c0aa2b7651553ea85bdab73d8358df9cfe77f2')

package() {
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 0755 pipecat_linux_* "${pkgdir}/usr/bin/pipecat"
}

# vim:set ts=2 sw=2 et:
