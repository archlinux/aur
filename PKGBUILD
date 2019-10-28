# Maintainer: ChacaS0 <incoming+chacas0-chksum-13830438-issue-@incoming.gitlab.com>
pkgname=chksum-git-git-bin
pkgver=0.1
pkgrel=1
pkgdesc="Check and compare easily the checksum of a file (binary version)."
arch=('x86_64')
url="https://gitlab.com/ChacaS0/chksum"
license=('Apache')
makedepends=('git')
provides=("${pkgname%-git-bin}")
conflicts=("${pkgname%-git-bin}")
source=("https://gitlab.com/chacas0/chksum/-/jobs/artifacts/master/download?job=build"
        'https://gitlab.com/ChacaS0/chksum/raw/master/LICENSE')
sha256sums=('SKIP'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

package () {
    install -Dm755 "${pkgname%-git-bin}" "$pkgdir/usr/bin/${pkgname%-git-bin}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git-bin}/LICENSE"
}