# Maintainer: Sid Pranjale <sidpranjale127@protonmail.com>
pkgname=auto-gpufreq
pkgver=1.0.0
pkgrel=1
pkgdesc="Tiny python daemon for conservative frequency scaling on GPUs."
arch=("x86_64")
url="https://gitlab.com/Sid127/auto-gpufreq"
licelse=("WTFPL")
depends=(python3 python-nvidia-ml-py)
makedepends=()
source=('auto-gpufreq'
        'auto-gpufreq.service')
sha256sums=('73483168b2a497e84b8ecb2ae364641e9b80f69ad3ccb2d4642f6c62956395b3'
            'fb93209144ad2dec1646f42cead5e2da3e0b6a95c87b498a68931fea1ae7430b')

package() {
    install -D -m 755 auto-gpufreq $pkgdir/usr/bin/auto-gpufreq
    install -D -m 644 auto-gpufreq.service -t "$pkgdir/usr/lib/systemd/system"
}
