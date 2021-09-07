# Maintainer: Mathieu Lemay <acidrain1@@gmail.com>
# Contributor: Gregory <gregory.mkv@gmail.com>

pkgname=handlr-bin
pkgver=0.6.4
pkgrel=2
pkgdesc="Powerful alternative to xdg-utils written in Rust"
arch=("x86_64")
url="https://github.com/chmln/handlr"
license=("MIT")
source=("${url}/releases/download/v${pkgver}/handlr"
        "${url}/raw/v${pkgver}/completions/handlr.fish"
        "${url}/raw/v${pkgver}/completions/_handlr")
sha256sums=('287e119d75d8bbdb3416f2b3a0962f2625cd4eec946c67305af2069da31ffc91'
            '842e16f29d868a5e6fbb382606c3637d1276eb88e796c775a8ae87b7823bc654'
            '38a9d67b6b40c1ea1b3f4dc6a650c61330d4c3a4b69182fd1dd16e015f4a1fd6')

package() {
  install -Dm 755 handlr "${pkgdir}/usr/bin/handlr"
  install -Dm 755 handlr.fish "${pkgdir}/usr/share/fish/vendor_completions.d/handlr.fish"
  install -Dm 755 _handlr "${pkgdir}/usr/share/zsh/site-functions/_handlr"
}
