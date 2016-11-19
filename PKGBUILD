# Maintainer: montag451 <montag451 [at] laposte (dot) net>

pkgname=git-annex-remote-rclone
pkgver=0.4
pkgrel=2
pkgdesc='A git-annex special remote using rclone'
arch=('any')
url='https://github.com/DanielDent/git-annex-remote-rclone'
license=('GPL3')
depends=('git-annex' 'rclone>=1.29' 'rclone<=1.34' 'bash')
source=("https://github.com/DanielDent/git-annex-remote-rclone/archive/v${pkgver}.tar.gz")
sha512sums=('62c22557ad488cce8cbdf827674eb2c972c39d6c8804277eda173c306526b8722872295eaaaf7509484bf3a9dca04190db7d0a877be4800f28bc48b6cbb3b3fc')

package() {
    cd "${pkgname}-${pkgver}"
    install -m 755 -D "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
