# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp
pkgver=3.1
pkgrel=1
pkgdesc='A wrapper for the lf file manager with in-terminal media previews, on-exit directory changing and much more'
license=('MIT')
arch=('x86_64')
url="https://gitlab.com/a4to/lfp"
depends=(lf zsh ffmpeg graphicsmagick openslide ghostscript bat fzf dunst dialog xsel lolcat python3 python-docopt python-pillow python-attrs)
conflicts=(lfp-git)
optdepends=(
  'nodejs: to make use of lfps built in node actions manager'
  )
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '0738045516f3b81c1e21aec474c2bee38f8b0d216c95509198db132e6928b13531dfa58be6b23222900942f790f0ebb6579c67e838b5f88395f79338ed5716be'
  '602d5cbf199e9ae9edab53f56bc467b78ff29b8d3788a6f7849e827beb1a9e1d449a19f8b121b83409f075edee85c3673cb3014c69d306a3d52ec980bd8b3e28'
  )
md5sums=(
  '7fbf0424bae92e6442dd1a79028c6ad2'
  'ef2e165b764662bea35692c9f9f9a00f'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
  cd "$srcdir/$pkgname"
  make clean install
}
