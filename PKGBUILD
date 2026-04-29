# Maintainer: Homer Xing <homer dot hsing at gmail dot com>

pkgname=fairy-stockfish-xiangqi-nnue
pkgver=20251105
pkgrel=1
pkgdesc='Xiangqi NNUE neural network for Fairy-Stockfish'
arch=('any')
url='https://github.com/fairy-stockfish/Fairy-Stockfish-NNUE'
license=('GPL-3.0-or-later')
options=(!strip)
source=('https://github.com/fairy-stockfish/Fairy-Stockfish-NNUE/raw/master/xiangqi-c07e94a5c7cb.nnue')
sha256sums=('c07e94a5c7cbeae443ed79a8fa412875d833a7f8e04333815e39729c59d52e11')

package() {
  install -Dm644 xiangqi-c07e94a5c7cb.nnue \
    "${pkgdir}/usr/share/fairy-stockfish/xiangqi-c07e94a5c7cb.nnue"
}
