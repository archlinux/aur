# Maintainer: Popolon <Popolon @ popolon . org>

_pkgname=nomnatong-fonts
pkgname="${_pkgname}"
pkgver=5.12
pkgrel=1
pkgdesc="Vietnamese Nôm Preservation Foundations vietnamese Hán-Nôm script fonts"
arch=('any')
url="https://nomfoundation.org/nom-tools/Nom-Font"
license=('MIT')
source=("https://github.com/nomfoundation/font/releases/download/v${pkgver}/NomNaTong-Regular.otf"
        "https://github.com/nomfoundation/font/releases/download/v${pkgver}/NomNaTong-Regular.ttf"
        "https://github.com/nomfoundation/font/releases/download/v${pkgver}/NomNaTongLight.ttf"
        "https://github.com/nomfoundation/font/raw/refs/heads/master/LICENSE")
sha512sums=('44228e2708ece1d5526256ebd1dab3e1c663aee83c020533dd22bb7c1789597239785e0b87e39222f01bfc22be5776ce760aeb1cf8a4173a2c82b3bfe5ec5bc3'
            '5b7c26a077021d266a8fa72cf8ec02f51b00e7a35888325f07fc0214f893ce90185453d2ad705892b1c161b7619b009887d554d29c9ca7daed7cbeb7a8e85bb0'
            '6afdc34f7d8e0e4b8b27e815e10953cb40b13c4f4bb104c7f85f71a51250546d4cfc748df0ba0f58cadb769257fc32ae123e0d503ecb125abe034395448255f5'
            'a526b67b66e2cddc2c360d64119e42f16ef465fdafc1c1a18c0cdf1ff8c7a70e20fcff9fff1c0b998e1f9aa0c2a067e01611c3b312861655b71b92de9d932c28'
           )


package() {
  install -d "${pkgdir}/usr/share/fonts/${_pkgname}"
  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -m 0644 *.ttf *.otf "${pkgdir}/usr/share/fonts/${_pkgname}/"
}

# vim:set et sw=2 ts=2 tw=79:
