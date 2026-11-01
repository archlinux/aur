# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=q2-feature-table
pkgver=2026.10.0
pkgrel=1
pkgdesc='QIIME 2 manipulation and visualization of sample by feature tables'
arch=(any)
url=https://github.com/qiime2/q2-feature-table
license=(BSD-3-Clause Apache-2.0 MIT ISC)
depends=('python' 'python-qiime2>=2026.10.0' 'python-rachis>=2026.10.0' 'python-q2-types>=2026.10.0' 'python-q2templates>=2026.10.0' 'python-biom-format' 'python-scikit-bio' 'python-numpy' 'python-pandas' 'python-scipy' 'python-matplotlib' 'python-seaborn' 'python-ipywidgets' 'python-rnanorm')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel' 'nodejs' 'npm')
checkdepends=('python-pytest' 'python-selenium' 'chromium' 'firefox' 'geckodriver')
optdepends=('python-selenium: Run the installed browser tests'
            'chromium: Run the installed Chromium visualization tests'
            'firefox: Run the installed Firefox visualization tests'
            'geckodriver: Drive Firefox in the installed visualization tests')
_commit=92201e4db69880e2741a233509e24161dfacfa8b
_vega_commit=e43613a3266dab4c0954133ab7f9941a345f7d51
_embed_commit=d58e37cc521868168688cb08a7be59bc1d992468
_jquery_commit=ef18fe9af5db5088657d42fde07bb23b19d0c494
_tables_commit=6e7650e79da74bde9779f59a3cbb24d3384851f4
_fixed_commit=7cf0b29dd3d805e373e6cd1aad5efbc6fffbf1dd
_column_commit=9321d87a80947afb73940c94f1a441639fb80479
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        "vega-5.3.5.tar.gz::https://codeload.github.com/vega/vega/tar.gz/e43613a3266dab4c0954133ab7f9941a345f7d51"
        "vega-embed-3.18.2.tar.gz::https://codeload.github.com/vega/vega-embed/tar.gz/d58e37cc521868168688cb08a7be59bc1d992468"
        "jquery-3.7.0.tar.gz::https://codeload.github.com/jquery/jquery/tar.gz/ef18fe9af5db5088657d42fde07bb23b19d0c494"
        "datatables-2.3.8.tar.gz::https://codeload.github.com/DataTables/DataTablesSrc/tar.gz/6e7650e79da74bde9779f59a3cbb24d3384851f4"
        "fixedheader-4.0.6.tar.gz::https://codeload.github.com/DataTables/FixedHeader/tar.gz/7cf0b29dd3d805e373e6cd1aad5efbc6fffbf1dd"
        "columncontrol-1.2.1.tar.gz::https://codeload.github.com/DataTables/ColumnControl/tar.gz/9321d87a80947afb73940c94f1a441639fb80479"
        package-lock.json vega-embed-package-lock.json jquery-package-lock.json datatables-package-lock.json build-frontends.py copy-frontend-licenses.py export-frontend-notices.patch
        "lucide-LICENSE::https://raw.githubusercontent.com/lucide-icons/lucide/f12b0de177fbc2a6795e99be065887e72b237123/LICENSE"
        "feather-LICENSE::https://raw.githubusercontent.com/feathericons/feather/1b002399e8758fb2bccea4d07312dc9e0f43dcb8/LICENSE"
        offline_usage_tests.py
        "usage-sample-metadata.tsv::https://data.qiime2.org/usage-examples/moving-pictures/sample-metadata.tsv"
        "usage-filtering-table.qza::https://data.qiime2.org/usage-examples/filtering/table.qza"
        "usage-rep-seqs.qza::https://data.qiime2.org/usage-examples/metadata/rep-seqs.qza"
        "usage-dada2.qza::https://data.qiime2.org/usage-examples/moving-pictures/rep-seqs-dada2.qza"
        "usage-deblur.qza::https://data.qiime2.org/usage-examples/moving-pictures/rep-seqs-deblur.qza"
        "usage-cancer-taxonomy.qza::https://docs.qiime2.org/jupyterbooks/cancer-microbiome-intervention-tutorial/data/030-tutorial-downstream/020-taxonomy/taxonomy.qza")
sha256sums=('817fbb07a13d7fc0b33a6fe293e73e12b9b7953da322f13eed13c0626d6db38f'
            'b26cccb03a9c7609da3aed99229df9c299d436910a22caf4ac1699f819b3124b'
            'a31fb8a338d0d119ab5d9bea89f22771cc7f9f547f39a2669bf58e61c7abd6e2'
            'cbbe3247a2cde36397a6de5330acfada93d4f0711d65fc11c164c1e10f968bb1'
            'cb6900bd74519c18b07125f33a66df7b9b1d06e32dc23fc24fe2f335609de63f'
            '9494f16bf9c48f78b4487eda991d98fccbaecbe309d00c071bf4ec7358a6f4fe'
            '3031299a9865736ec390d954a0e0ba333a088ff7a2f7fca73d7fb86bc6cdcb9d'
            'e673df2f9df7e2e932fb698c3c1916522a1f3ea30aefa692616b44c64214dc72'
            '478ec5224c0f269c8e24114cdafba4a2d81e1eeb261295a19e5f20d047f1e1a8'
            'd3a7c8deae00b32f19e21666471586ccef2d86a4e9bb4a117cfd04bf9c18bdcd'
            'a83ab54859496f2d96f86a559933b358ba1e01a2b5428e40fed513f23bf8028a'
            '48e6b888873d4a4761e7f1d2acbc60b4777041f8fe6e0ea7b616b4165f7415aa'
            '2df84755b8a735f8b00996f8229a584f993e5c115638332cef93db7f58dd36f9'
            '9627c74d66f28b6ac90437a9b542f9f285c1d9e98d1bb301e66b965c8be6f02d'
            '1e7290b35280a048667bbf0ebabac1c7fd52a75300e8b2946ac165715997f2bc'
            '308028e93fcf84972523cdf6e616f73168546b4953895f516d01287f16fe7bee'
            '80a32a5208c0899ac4f3b8cb16b72bfc068b3928c3520994a559e14666818bc9'
            '9dbfbedd90776d77c431faa914d81b0d6299fff10c364216dbcd5c6df5382cc9'
            '0efe295afb8bb4b1d3ec836346ad09aebf51cbd6db51e2d7a3515625b966abbf'
            '0de504061ecb85462fbfe4a09636050820292379cf860d9834980d04dae22dd9'
            'b081ce79cdf92328812d5819db3089b5199b771cc643801893526b4bd36d3bba'
            'ad6e8e9d129e0f5d41379679ac39e0f094cdecf6cfd7b53eaeb01ce3f3bc6066'
            '14bb7fa2e85968098db77292d7cf5275ca3ce72b13ff77243147ed99969ea130')
noextract=('usage-filtering-table.qza' 'usage-rep-seqs.qza' 'usage-dada2.qza' 'usage-deblur.qza' 'usage-cancer-taxonomy.qza')

prepare() {
  patch -Np1 -d "q2-feature-table-$_commit" -i "$srcdir/export-frontend-notices.patch"
  cp package-lock.json "vega-$_vega_commit/package-lock.json"
  cp vega-embed-package-lock.json "vega-embed-$_embed_commit/package-lock.json"
  cp jquery-package-lock.json "jquery-$_jquery_commit/package-lock.json"
  cp datatables-package-lock.json "DataTablesSrc-$_tables_commit/package-lock.json"
  install -d "DataTablesSrc-$_tables_commit/extensions/FixedHeader" \
    "DataTablesSrc-$_tables_commit/extensions/ColumnControl"
  cp -a "FixedHeader-$_fixed_commit/." "DataTablesSrc-$_tables_commit/extensions/FixedHeader/"
  cp -a "ColumnControl-$_column_commit/." "DataTablesSrc-$_tables_commit/extensions/ColumnControl/"
  # Only browser assets are needed. Avoid upstream dataset/native-canvas install
  # hooks and run the pinned source build commands explicitly below.
  local directory
  for directory in "vega-$_vega_commit" "vega-embed-$_embed_commit" \
                   "jquery-$_jquery_commit" "DataTablesSrc-$_tables_commit"; do
    npm ci --prefix "$directory" --legacy-peer-deps --ignore-scripts --no-audit --no-fund
  done
}

build() {
  python build-frontends.py "vega-$_vega_commit" "vega-embed-$_embed_commit" \
    "jquery-$_jquery_commit" "DataTablesSrc-$_tables_commit" frontend-assets
  python copy-frontend-licenses.py "vega-$_vega_commit" "vega-embed-$_embed_commit" \
    "jquery-$_jquery_commit" "DataTablesSrc-$_tables_commit" frontend-licenses "$srcdir"
  local assets="q2-feature-table-$_commit/q2_feature_table/_summarize"
  install -m644 frontend-assets/vega.min.js frontend-assets/vega-embed.min.js \
    "$assets/summarize_assets/vega/js/"
  install -m644 frontend-assets/datatables.min.js frontend-assets/datatables.min.css \
    "$assets/tabulate_seqs_assets/"
  install -d "$assets/summarize_assets/vega/third-party-licenses" \
    "$assets/tabulate_seqs_assets/third-party-licenses"
  cp -a frontend-licenses/vega/. "$assets/summarize_assets/vega/third-party-licenses/"
  cp -a frontend-licenses/datatables/. "$assets/tabulate_seqs_assets/third-party-licenses/"
  cd "q2-feature-table-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages --without-pip "$srcdir/check-env"
  "$srcdir/check-env/bin/python" -m installer "q2-feature-table-$_commit"/dist/*.whl
  local site_packages
  site_packages=$("$srcdir/check-env/bin/python" -I -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
  install -m644 "$srcdir/offline_usage_tests.py" "$site_packages/aur_q2_usage_fixtures.py"
  Q2_TEST_FIXTURES="$srcdir" MPLBACKEND=Agg "$srcdir/check-env/bin/python" -I - --import-mode=importlib -v \
    -p aur_q2_usage_fixtures --pyargs q2_feature_table --junitxml="$srcdir/pytest-results.xml" <<'PYTEST'
from pathlib import Path
import sys
import pytest
import q2_feature_table

installed = Path(q2_feature_table.__file__).resolve().parent
assert installed.is_relative_to(Path(sys.prefix).resolve()), installed
status = pytest.main(sys.argv[1:])
for name, module in tuple(sys.modules.items()):
    if name != 'q2_feature_table' and not name.startswith('q2_feature_table.'):
        continue
    origin = getattr(module, '__file__', None)
    if origin is None or 'tests' in name.split('.')[1:]:
        continue
    path = Path(origin).resolve()
    assert path.is_relative_to(installed), (name, path)
print('Installed runtime origin check passed:', installed)
raise SystemExit(status)
PYTEST
}

package() {
  cd "q2-feature-table-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -a "$srcdir/frontend-licenses/vega" "$srcdir/frontend-licenses/datatables" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
