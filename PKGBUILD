pkgbase='rawsteel-music-player'
pkgname='rawsteel-music-player'
pkgver=1.0.5
pkgrel=1
pkgdesc='A minimal music player with lyric show'
url='https://github.com/baijifeilong/rawsteelp'
depends=('python' 'python-pyqt5' 'python-pytaglib' 'python-chardet')
makedepends=('python-setuptools')
arch=('any')
license=('GPL3')
source=('https://files.pythonhosted.org/packages/f1/93/a448b269cf0b92fb55537cca0d0ecd642afad26eff081650a6ec25a91e26/rawsteel-music-player-1.0.5.tar.gz')
md5sums=('5922cd6108c75ece9cf393b650fedcce')


package() {
    echo Current directory: $(pwd) $(ls)
    cd "${srcdir}/${pkgname}-${pkgver}"
    echo Current directory: $(pwd) $(ls)
    python setup.py install --root="${pkgdir}" --optimize=1
}
