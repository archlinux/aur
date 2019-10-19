# Maintainer: Mohammad Hossein Sekhavat <sekhavat17@gmail.com>

pkgbase='python-streamlit'
pkgname=('python-streamlit')
_module='streamlit'
pkgver='0.48.1'
pkgrel=1
pkgdesc="Streamlit: Frontend library for machine learning engineers"
url="https://streamlit.io"
depends=(
	'python'
	'python-altair3>=3.2.0'
	'python-astor'
	'python-base58'
	'python-blinker'
	'python-boto3'
	'python-botocore'
	'python-click>=7.0'
	'python-enum-compat'
	'python-future'
	'python-pillow>5.1.0'
	'python-protobuf>=3.6.0'
	'python-requests'
	'python-toml'
	'python-tornado5'
	'python-tzlocal'
	'python-validators'
	'python-watchdog'
	'python-pandas'
	'python-numpy'
)
makedepends=('python-pip')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/ba/f4/aec55c04285d3e369c11574f7b95703bb3472ab17f03a488d3f5314cce8b/streamlit-0.48.1-py2.py3-none-any.whl")
sha256sums=('e2b78bae27fba241110ec5578262d83baecc55dd1089034c7388b5ce5c987cc5')

package() {
    cd "${srcdir}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
