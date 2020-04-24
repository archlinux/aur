# Maintainer: Mohammad Hossein Sekhavat <sekhavat17@gmail.com>

pkgbase='python-streamlit'
pkgname=('python-streamlit')
_module='streamlit'
pkgver='0.58.0'
pkgrel=1
pkgdesc="Streamlit: Frontend library for machine learning engineers"
url="https://streamlit.io"
depends=(
	'python'
	'python-altair'
	'python-astor'
	'python-base58'
	'python-blinker'
	'python-boto3'
	'python-botocore>=1.13.44'
	'python-cachetools>=4.0'
	'python-click>=7.0'
	'python-packaging'
	'python-dateutil'
	'python-enum-compat'
	'python-numpy'
	'python-pandas>=0.21.0'
	'python-pillow>=6.2.0'
	'python-protobuf>=3.6.0'
	'python-pydeck>=0.1.dev5'
	'python-requests'
	'python-toml'
	'python-tornado5'
	'python-tzlocal'
	'python-validators'
	'python-watchdog'
)
makedepends=('python-pip')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/1a/3e/ecb1b11fe3e6230bc1c7f37d75f4185a3a7dc066c223f12947a0d51c2bfb/streamlit-0.58.0-py2.py3-none-any.whl")
sha256sums=('05a1cc17d10f7c386a96a3712ec370fc9121bddd8984f5a81c1a69f7f4202e49')

package() {
    cd "${srcdir}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
