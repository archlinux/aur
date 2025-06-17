pkgname=finkyo-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="file server"
arch=('x86_64' 'aarch64')
url="https://github.com/quantulr/finkyo"
license=('MIT')
source_x86_64=(finkyo-$pkgver-x86_64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-amd64)
source_aarch64=(finkyo-$pkgver-aarch64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-aarch64)
sha512sums_x86_64=('a2ef029fcb10e28cb47cb9033c294c94698288e71a970d71c430cf5ad690876208edb95cf332dd27a10dacf9c05be7318cf87ac884bfb1b6c688386143e33671')
sha512sums_aarch64=('9657fde30e4b2488896a0908611c2a0f2185517d544d2eec166afab3ed39fa1824bfd7d41c0f182c33e7fa61f6afdfdb1d383822ed732541ccd215c47cbbee76')

package() {
  cd "$srcdir/"

  install -Dm755 finkyo-$pkgver-$CARCH "$pkgdir"/usr/bin/finkyo
}
