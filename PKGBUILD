# Maintainer: xz-dev <xiangzhedev at gmail dot com>
pkgname=mihomo-cap-git
pkgver=1.0.0
pkgrel=1
pkgdesc="mihomo with Capabilities for Transparent Proxies"
arch=(x86_64)
url="https://github.com/MetaCubeX/mihomo"
license=(MIT)
depends=(mihomo libcap)
provides=(mihomo-cap)
source=(mihomo-cap.hook mihomo-cap.sh)
sha512sums=('59fda3655e373ad4d62d6630c37eb41e02670a0e8ad928496ac0a5f930c11707928425c33db9b0d8e5b4b6aa2025e64f44c2fc3923954b9158ee488fb2977f6f'
            'ae481e649892715c0c00716bb978e155b371e306ff9a7e6aea60768cd95cae555e54aa67b84b28276c22da755099582ddefd0b67ff4e096ecc3018a29dbe5487')
install='mihomo-cap.sh'

package() {
    install -Dm644 "$srcdir"/mihomo-cap.hook -t "$pkgdir"/usr/share/libalpm/hooks/
}
