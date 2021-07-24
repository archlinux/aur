# Maintainer: Ilango Rajagopal <ilangokul@gmail.com>
# Contributor: Sébastien LEBEAU <sebcbi1 at gmail dot com>

pkgname=ngrok-bin
pkgver=2.3.40
pkgrel=1
pkgdesc="secure introspectable tunnels to localhost"
arch=(i686 x86_64 aarch64)
url="https://ngrok.com"
license=('custom')
provides=(ngrok)
options=(!strip)
source=("LICENSE")
source_i686=("https://bin.equinox.io/a/gsR7QMLiGHR/${pkgname%-bin}-$pkgver-linux-386.tar.gz")
source_x86_64=("https://bin.equinox.io/a/6sdfF9NmmRW/${pkgname%-bin}-$pkgver-linux-amd64.tar.gz")
source_aarch64=("https://bin.equinox.io/a/mSAgrgSTUyK/${pkgname%-bin}-$pkgver-linux-arm64.tar.gz")
sha256sums=('79c30992a7bb404119809119cf761af243b1dff819dd61018afffa469b4e23fb')
sha256sums_i686=('24da165d1f204786cc006d9ef1b7e919c8ebc40c57d1d95e2d07c4d43a5083cd')
sha256sums_x86_64=('6d095e7a411fc8bd9a82cfa32bb7d7bddebda510f629c76fa099cb4445815a43')
sha256sums_aarch64=('67bc9c55184eebf015e9704d7534475f4d4c73995ae4c5fdc81989d5c5038291')


package() {
	install -D "$srcdir/ngrok" "$pkgdir/usr/bin/ngrok"
	install -D "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

