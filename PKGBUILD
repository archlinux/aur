# Maintainer: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>
# Contributor: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>

pkgname='trufflehogregexes'
pkgver=0.0.7
pkgrel=0
pkgdesc="These regexes power truffleHog."
url="https://github.com/dxa4481/truffleHogRegexes + https://pypi.org/project/truffleHogRegexes/#history"
arch=('any')
license=('GPL-2.0')
depends=('python' 'python-setuptools')
makedepends=()
provides=('python-trufflehogregexes')
source=("https://files.pythonhosted.org/packages/00/12/c50be477765ba54af1a9fabfc95e7ca318b8543cfde2bacc213214b809a1/truffleHogRegexes-0.0.7.tar.gz")
sha512sums=('ff3112f93469d6ee1bb1851261eb3d1f2794cc352598df2e426b011864e84e37f20e053e4f72325ed6a61dd2ff78d7148d6c399489663f4af290f9140a1cf7d9')

package() {
  cd "${srcdir}/truffleHogRegexes-${pkgver}"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
