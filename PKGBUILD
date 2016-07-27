# Maintainer: montag451 <montag451 at laposte dot net>

pkgname=git-annex-remote-rclone
pkgver=v0.3
pkgrel=2
pkgdesc='A git-annex special remote using rclone'
arch=('any')
url='https://github.com/DanielDent/git-annex-remote-rclone'
license=('GPL3')
depends=('git-annex' 'rclone>=1.29' 'rclone<=1.32' 'bash')
source=("https://github.com/DanielDent/git-annex-remote-rclone/archive/${pkgver}.tar.gz")
sha512sums=('63c4cd86cbde224c2555fc34ff9762904baf6bf927988db2deb68b6915ef6e82bf8799229fdccb8218c940f0523682d58b28a9218848b3f80ef337f3ab7b3e40')

package() {
    cd "${pkgname}-${pkgver#v}"
    install -m 755 -D "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
}
