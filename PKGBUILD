# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ethaddrgen-bin"
pkgver=1.0.7
pkgrel=1
pkgdesc="Custom Ethereum vanity address generator made in Rust"
url="https://github.com/Limeth/ethaddrgen"
license=("GPL3")
arch=("x86_64" "i686" "aarch64" "armv7h")
provides=("ethaddrgen")
source_x86_64=("https://github.com/Limeth/ethaddrgen/releases/download/v$pkgver/ethaddrgen-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("https://github.com/Limeth/ethaddrgen/releases/download/v$pkgver/ethaddrgen-v$pkgver-i686-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/Limeth/ethaddrgen/releases/download/v$pkgver/ethaddrgen-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("https://github.com/Limeth/ethaddrgen/releases/download/v$pkgver/ethaddrgen-v$pkgver-armv7-unknown-linux-gnueabihf.tar.gz")
b2sums_x86_64=('bf09e8135ac427cb9a5f5f340f9255243280ca3361a3e0e45dde83caebbfce493240aa38e494bcb8f3d18baa83ff79517437ef0b1466c2e08e553c55f63338c1')
b2sums_i686=('4a2e5c540809aaa372b08ed64efb5b5412f28aeb6e711ffbd9d182063d9744d77676a5230ce2df6cd682183a3abb36cab14e9658c147e6930ae1e3315562bf1f')
b2sums_aarch64=('307220b26f0ec057a766f9fc6d94ef65e2329872bfe4133d5651da41de4315b59447dbbfd1d0f329e84fcbb3ac207af442a240482ed31b3f0b9466a80d583292')
b2sums_armv7h=('6ea808edb3b4e4745a7e68c4fb5a5adf10e85750feea77e2e14bee05c882305a365576abdd5f995b0deb50665db9d6f20f4ff63944882d4bb9f456fdd4ddc140')
options=("!strip")

package(){
 install -D -m 755 "ethaddrgen"  -t "$pkgdir/usr/bin"
}
