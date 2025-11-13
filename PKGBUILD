# Contributor: Gerald Wu <gerald at geraldwu dot com>
    # Maintainer: tee < teeaur at duck dot com >

    pkgname=dapr-cli-bin
    pkgver=1.16.5
    pkgrel=2
    pkgdesc='Command-line tools for Dapr'
    arch=('x86_64' 'aarch64')
    url='https://github.com/dapr/cli'
    license=('Apache-2.0')
options=('!strip' '!emptydirs')
provides=('dapr')
source_x86_64=("dapr-cli-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_amd64.tar.gz"
"dapr-cli-$pkgver-linux-amd64.tar.gz.sha256::${url}/releases/download/v${pkgver}/dapr_linux_amd64.tar.gz.sha256")
source_aarch64=("dapr-cli-$pkgver-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_arm64.tar.gz"
"dapr-cli-$pkgver-linux-arm64.tar.gz.sha256::${url}/releases/download/v${pkgver}/dapr_linux_arm64.tar.gz.sha256")
sha256sums_x86_64=('39fd305d73907ce4ee3f974054b7d6fb0289e1606881962dc1d7cff96a12de8f'
                   '6d4c4d5d60fcb72c7b315bb4d6fe5e50802bdfee18bc9b1b6781aab6bcbd006a')
sha256sums_aarch64=('bedba0550afeec47d17926ce7ac0b89187146447b2447c19e62f8696c23b098e'
                    'a2f6affb127f92f50c5ceb30c297be51de5e690461466dfb529f0066fbdf86d1')

package() {
    install -Dm755 dapr "$pkgdir/usr/bin/dapr"
}

