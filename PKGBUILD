pkgname=lianpkg-bin
pkgver=0.4.5
pkgrel=1
pkgdesc="Wallpaper Engine .pkg unpacker and resource tool"
keywords=('wallpaper-engine' 'pkg' 'unpacker' 'wallpaper' 'resource' 'tex' 'rust')
arch=('x86_64')
url="https://github.com/Yueosa/lianpkg"
license=('GPL3')
depends=('glibc')


source=("lianpkg-${pkgver}::https://github.com/Yueosa/lianpkg/releases/download/v${pkgver}/lianpkg_${pkgver}_linux_x86_64")
sha256sums=('154211f6a19c60eb80b84996d794f52e53ae5a05951228a91ae93954b74a260d')

package() {
  install -Dm755 "$srcdir/lianpkg-${pkgver}" "$pkgdir/usr/bin/lianpkg"
}

