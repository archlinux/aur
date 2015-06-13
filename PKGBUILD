# Maintainer: Kyle Meyer <kyle@kyleam.com>

pkgname=tikz-bayesnet
pkgver=0.1
pkgrel=1
pkgdesc='TikZ library for drawing Bayesian networks'
arch=('any')
license=('LPPL')
url='https://github.com/jluttine/tikz-bayesnet'
depends=('texlive-core' 'texlive-latexextra' 'texlive-science')
source=("https://github.com/jluttine/$pkgname/archive/v$pkgver.tar.gz")
sha1sums=('31c1a9d7bc7c4dcde10c1408260b58036c959804')
install='tikz-bayesnet.install'

package()
{
    install -D "$srcdir/$pkgname-$pkgver/tikzlibrarybayesnet.code.tex" \
        "$pkgdir/usr/share/texmf/tex/latex/$pkgname/tikzlibrarybayesnet.code.tex"
}
