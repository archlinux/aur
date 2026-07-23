# Maintainer: Ricky Morabito <codericcardo@gmail.com>

pkgname=tokscale-bin
pkgver=4.7.0
pkgrel=1
pkgdesc='CLI tool and TUI for tracking token usage and costs from AI coding agents (prebuilt binary)'
arch=('x86_64')
url='https://github.com/junhoyeo/tokscale'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('tokscale')
conflicts=('tokscale' 'tokscale-git')
source=("tokscale-v$pkgver-linux-x64-gnu.tgz::https://registry.npmjs.org/@tokscale/cli-linux-x64-gnu/-/cli-linux-x64-gnu-$pkgver.tgz"
         "tokscale-LICENSE::https://raw.githubusercontent.com/junhoyeo/tokscale/v$pkgver/LICENSE")
b2sums=('3bd26054a8f318c59da2ce3b0efe7c86ce82381695f755bb847d1e91cfc97a038c9c4fc4c3828f9c59eb6903a23b4eb1b8667c5d72e2b3da103f16c0013f8490'
        'b1bda54b1595c875bc2ef3d02acbc5f4371406bd5c21fb56ecef98b2bc8357baf56dd8908e6f1867f4f4bc5c8ceeb7900c01e9f6ca4e44f31721419baba32381')

package() {
    install -Dm755 "package/bin/tokscale" "$pkgdir/usr/bin/tokscale"
    install -Dm644 "tokscale-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
