# Maintainer: Shane Donohoe <shane@donohoe.cc>

pkgname=python-youtube-sm-parser
pkgver=0.1.6
pkgrel=1
pkgdesc="Output youtube subscriptions using subscription_manager file"
arch=('any')
url="https://github.com/shanedabes/youtube_sm_parser"
license=('APACHE')
depends=('python' 'python-xmltodict' 'python-requests-futures')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shanedabes/youtube_sm_parser/archive/${pkgver}.tar.gz")
sha256sums=('d11671d284ce4d8cc10fe9d97a693d4259c40b1103cbcfd066b7a7a0fbd65734')

package() {
    cd "youtube_sm_parser-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
