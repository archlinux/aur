# Maintainer: montag451 <montag451 [at] laposte (dot) net>

pkgname=git-annex-remote-rclone
pkgver=0.5
pkgrel=1
pkgdesc='A git-annex special remote using rclone'
arch=('any')
url='https://github.com/DanielDent/git-annex-remote-rclone'
license=('GPL3')
depends=('git-annex' 'rclone>=1.29' 'rclone<=1.36' 'bash')
source=("https://github.com/DanielDent/git-annex-remote-rclone/archive/v${pkgver}.tar.gz")
sha512sums=('3dd0493856952eee93f95ba637bd95c4971a00ae4a2e160894f9bc787f0090fbe5ab456de28e5ba0f7dae83320450d75813c0a3e3887de4aefa938483571cd2f')

package() {
    cd "${pkgname}-${pkgver}"
    install -m 755 -D "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
