# Contributor: Juan Francisco Miranda <jfmiranda at gmail dot com>

pkgname=ookla-speedtest-cli-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='Internet connection measurement for developers'
arch=('x86_64' 'aarch64')
url='https://www.speedtest.net/apps/cli'
license=('Apache-2.0')
options=('!strip' '!emptydirs')
provides=('speedtest')
source_x86_64=("ookla-speedtest-$pkgver-linux-x86_64.tgz::https://install.speedtest.net/app/cli/ookla-speedtest-$pkgver-linux-x86_64.tgz")
source_aarch64=("ookla-speedtest-$pkgver-linux-aarch64.tgz::https://install.speedtest.net/app/cli/ookla-speedtest-$pkgver-linux-aarch64.tgz")
sha256sums_x86_64=('5690596c54ff9bed63fa3732f818a05dbc2db19ad36ed68f21ca5f64d5cfeeb7')
sha256sums_aarch64=('3953d231da3783e2bf8904b6dd72767c5c6e533e163d3742fd0437affa431bd3')

package() {
    install -Dm755 speedtest "$pkgdir/usr/bin/ookla-speedtest"
}