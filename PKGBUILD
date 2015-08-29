# Maintainer: raininja <daniel.mclellan[at]gmail[dot]com
pkgname=saslfinger
pkgver=1.0.3
pkgrel=2
pkgdesc="Tracer for postfix SASL issues"
url="http://postfix.state-of-mind.de/patrick.koetter/saslfinger/"
arch=('any')
license=('GPLv3')
depends=('postfix')
source=("http://postfix.state-of-mind.de/patrick.koetter/saslfinger/saslfinger-$pkgver.tar.gz")
sha512sums=('f7ea50efff1e4bb8a70ac39b140f1d0034c2219a0c5a70b5e3abc7b1df57074dbed430530e6f5a0907edd9f6718ea181f0f64c0be71adb457a94fe0637371312')



package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 saslfinger  "${pkgdir}/usr/bin/saslfinger"
  install -Dm644 saslfinger.1 "${pkgdir}/usr/share/man/man1/saslfinger.1"

}

