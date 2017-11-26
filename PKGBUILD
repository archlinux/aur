# Maintainer: Timur Kiyui <timur@linux.com>

pkgname=systemd-brcmfmac-git
pkgver=0.1
pkgrel=1
pkgdesc='Disable the `brcmfmac` module on shutdown'
arch=('x86_64')
url='https://github.com/TimurKiyivinski/systemd-brcmfmac'
license=('MIT')
source=('git+https://github.com/TimurKiyivinski/systemd-brcmfmac.git')
sha256sums=('SKIP')
install='systemd-brcmfmac-git.install'

package() {
    install -dm755 "$pkgdir/etc/systemd/system/"
    cp "$srcdir/${pkgname/-git/}/remove-brcmfmac.service" "$pkgdir/etc/systemd/system/"
}
