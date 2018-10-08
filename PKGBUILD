# Maintainer: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>
# Contributor: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>

pkgname='trufflehog'
pkgver=2.0.97
pkgrel=1
pkgdesc="Searches through git repositories for high entropy strings and secrets, digging deep into commit history"
url="https://github.com/dxa4481/truffleHog.git"
arch=('any')
license=('GPL-2.0')
depends=('python' 'trufflehogregexes'=0.0.4 'python-gitpython=2.1.1' 'python-pytest-cov') 
provides=('python-trufflehog')
source=("https://files.pythonhosted.org/packages/21/99/89f662eeb021c28d75fb42ce1ee28a9fcea653ae5b1539e2487c60eb2eaa/truffleHog-2.0.97.tar.gz")
sha512sums=('abaa39149627d7a4fb58055c595f32057eacce5549380e737245f8aaf665d074fb739c76bda8527740c4034e610001bf61af9fd3359b447a62cf2878c07cb99c')

package() {
  cd "${srcdir}/truffleHog-${pkgver}"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
