# Maintainer: ChacaS0 <incoming+chacas0-chksum-13830438-issue-@incoming.gitlab.com>
pkgname=chksum-bin-git
pkgver=0.1
pkgrel=1
pkgdesc="Check and compare easily the checksum of a file (binary version)."
arch=('x86_64')
url="https://gitlab.com/ChacaS0/chksum"
license=('Apache')
makedepends=('git')
provides=("chksum")
conflicts=("chksum")
source=("https://gitlab.com/chacas0/chksum/-/jobs/artifacts/master/download?job=build"
        'https://gitlab.com/ChacaS0/chksum/raw/master/LICENSE')
sha256sums=('SKIP'
    '446338dfeac7569baa018f9e34ce69f827ac9df19b313552c96e1887af344f45')

package () {
    install -Dm755 "${pkgname%-bin-git}" "$pkgdir/usr/bin/${pkgname%-bin-git}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin-git}/LICENSE"
}