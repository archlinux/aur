# Maintainer: montag451 <montag451 [at] laposte (dot) net>
# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=git-annex-remote-rclone
pkgver=0.8
pkgrel=1
pkgdesc='A git-annex special remote using rclone'
arch=('any')
url='https://github.com/git-annex-remote-rclone/git-annex-remote-rclone'
license=('GPL3')
depends=('git-annex' 'rclone>=1.29' 'bash')
source=("https://github.com/git-annex-remote-rclone/git-annex-remote-rclone/archive/v${pkgver}.tar.gz")
sha512sums=('2137c6316abec239e0c1348cfcc12f541551c6d4bf61daaac9cbd876acf787c683cfa0d45ab6bdefdf07052137b0849eee913aaaef118c5b289946431c2c6941')

package() {
    cd "${pkgname}-${pkgver}"
    install -m 755 -D "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
