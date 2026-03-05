# Maintainer: <https://aur.archlinux.org/account/zeauw>

pkgname=sshproxy-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="sshproxy provides a type of single-sign-on capability for SSH to NERSC systems."
arch=('x86_64')
url='https://portal.nersc.gov/cfs/mfa/'
license=('custom')
depends=('glibc')
source=("sshproxy-${pkgver}-linux-${arch}.tar.gz::https://portal.nersc.gov/cfs/mfa/sshproxy-${pkgver}-linux-${arch}.tar.gz"
    "LICENSE")
sha256sums=("6ac773f3741c5da6dbc9f7d79fed1859400d30adbf42d1b67114456e08275800"
    "3165d1dcc087757481edcffc2f338061eb4b4bb6b27012916bee6c410c644cbe")

package() {
    install -D -m755 sshproxy "$pkgdir/usr/bin/sshproxy"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}