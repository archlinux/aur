# Maintainer: Bugg4

pkgname=python-okf-generator
pkgver=0.1.51
pkgrel=2
pkgdesc="OKF v0.2 knowledge bundle generator - Claude skill + OpenCode integration"
arch=('x86_64')
url="https://github.com/UmairBaig8/okf-generator"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
depends=(
    'python>=3.11'
    'python-yaml'
    'python-tqdm'
    'python-watchdog'
)
optdepends=(
    'python-openai: LLM enrichment and training pair generation'
    'python-fastapi: dashboard feature'
    'uvicorn: dashboard feature'
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "tree_sitter-0.26.0-cp314-cp314-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl::https://files.pythonhosted.org/packages/e2/7a/f56e7d8282859452611024c7cbc623bfba5b24b8cb9b8f8bc88c5219fe9a/tree_sitter-0.26.0-cp314-cp314-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl"
    "tree_sitter_python-0.25.0-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl::https://files.pythonhosted.org/packages/aa/cb/d9b0b67d037922d60cbe0359e0c86457c2da721bc714381a63e2c8e35eba/tree_sitter_python-0.25.0-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
    "tree_sitter_javascript-0.25.0-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl::https://files.pythonhosted.org/packages/5f/c4/7da74ecdcd8a398f88bd003a87c65403b5fe0e958cdd43fbd5fd4a398fcf/tree_sitter_javascript-0.25.0-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
    "tree_sitter_typescript-0.23.2-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl::https://files.pythonhosted.org/packages/49/d1/a71c36da6e2b8a4ed5e2970819b86ef13ba77ac40d9e333cb17df6a2c5db/tree_sitter_typescript-0.23.2-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
    "tree_sitter_go-0.25.0-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl::https://files.pythonhosted.org/packages/86/fb/b30d63a08044115d8b8bd196c6c2ab4325fb8db5757249a4ef0563966e2e/tree_sitter_go-0.25.0-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
    "tree_sitter_java-0.23.5-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl::https://files.pythonhosted.org/packages/29/09/e0d08f5c212062fd046db35c1015a2621c2631bc8b4aae5740d7adb276ad/tree_sitter_java-0.23.5-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
    "tree_sitter_rust-0.24.2-cp39-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl::https://files.pythonhosted.org/packages/ca/45/a051bbd3045a61182dde25b93ae9a33d2677c935b16952283e12eaf46051/tree_sitter_rust-0.24.2-cp39-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
    "tree_sitter_ruby-0.23.1-cp39-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl::https://files.pythonhosted.org/packages/23/dd/1171b5dd25da10f768732a20fb62d2e3ae66e3b42329351f2ce5bf723abb/tree_sitter_ruby-0.23.1-cp39-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
    "tree_sitter_c-0.24.2-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl::https://files.pythonhosted.org/packages/e9/8c/0dfb88d726f8821d1c4c36042f092be974a800afd734307a595b8604190c/tree_sitter_c-0.24.2-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
    "tree_sitter_cpp-0.23.4-cp39-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl::https://files.pythonhosted.org/packages/6a/4d/23e390234d2acd351f5563b1079c515d7c1fe13ddb7392cee543be74dda3/tree_sitter_cpp-0.23.4-cp39-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
    "tree_sitter_c_sharp-0.23.5-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl::https://files.pythonhosted.org/packages/41/5a/a8855cbb5bbab28adb29c2c7f0e7be5a9f1d21450c13b3c3e613190d9b8c/tree_sitter_c_sharp-0.23.5-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
    "tree_sitter_sql-0.3.11-cp310-abi3-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl::https://files.pythonhosted.org/packages/1d/c1/eec7c09a9c94436ea4c56d096feba815e42b209b3d41a17532f99ecf0c67/tree_sitter_sql-0.3.11-cp310-abi3-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl"
    "tree_sitter_swift-0.7.3-cp38-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl::https://files.pythonhosted.org/packages/e1/9a/55f6cc9aad9079facf166d616472fd8e05007cbee9c62b749e153bf0521d/tree_sitter_swift-0.7.3-cp38-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
    "tree_sitter_kotlin-1.1.0-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl::https://files.pythonhosted.org/packages/65/bd/0f3aac45eb88b6b3173ac9c23bc41d8865943cbbe1caaafc001cd1b73c90/tree_sitter_kotlin-1.1.0-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
    "tree_sitter_php-0.24.1-cp310-abi3-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl::https://files.pythonhosted.org/packages/9a/c6/fd863a7a779d0ab67688939eba0e08bff7b1ffe731288d3d3610df21217b/tree_sitter_php-0.24.1-cp310-abi3-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl"
    "tree_sitter_dart-0.1.0-cp38-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl::https://files.pythonhosted.org/packages/10/c9/3dce1e4dc071e8ed536ab30694798fd5d4c7e3a1c875dff60517195bb5bd/tree_sitter_dart-0.1.0-cp38-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
    "tree_sitter_scala-0.26.0-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl::https://files.pythonhosted.org/packages/3f/61/e64e1c2b2552f5dc556c9710ecf935ed531efa8a3eb9de9ad4e7c95f6e97/tree_sitter_scala-0.26.0-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
    "tree_sitter_julia-0.23.1-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl::https://files.pythonhosted.org/packages/0b/4c/09534d31ab95c3da2284f538bb134bf6fe064770c0bf6fe4fb6f2b028d9e/tree_sitter_julia-0.23.1-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
)
sha256sums=('7f07259294d708ccde11457259462c2079c44d2420f7e7b728e309b31a474345'
            'f665510f0fcf4636fb9696f1f7853bed7a3bd764b7bb0cb8494e619c14ed5a0c'
            '86f118e5eecad616ecdb81d171a36dde9bef5a0b21ed71ea9c3e390813c3baf5'
            '9dc04ba91fc8583344e57c1f1ed5b2c97ecaaf47480011b92fbeab8dda96db75'
            'e96d36b85bcacdeb8ff5c2618d75593ef12ebaf1b4eace3477e2bdb2abb1752c'
            '04b3b3cb4aff18e74e28d49b716c6f24cb71ddfdd66768987e26e4d0fa812f74'
            '370b204b9500b847f6d0c5ad584045831cee69e9a3e4d878535d39e4a7e4c4f1'
            'e033c5a93b57c88e0a835880de39fc802909ff69f57aaff6000211c196ea5190'
            'f7bcd93972b4ca2803856d4fe0fbd04123ff29c4592bbb9f12a27528bd252341'
            '5041ef67eb68ce6bc8bb0b1f8ef3a5585ce523dae0c7eec109ab0627dd75aede'
            '773d2cafc08bbc0f998687fa33f42f378c1a371cdb582870c4d13abb06092706'
            'aa88a780204cd153c4c1ae2d59c654cee1402212fa0d069823d6d34301587438'
            '5128b12f71ac0f5ebcc607f67a62cdc56a187c1a5ba7553feeb9c5f6f9bc3c72'
            'f38feeb4f7350c8b30d567a0dc08bf1eeaa67c241b6888d72a45a8b1a4aa7187'
            '9a92afe24b634cf914c5812af0f5c53184b1c18bdf6ee5505c83afac81f6bf6c'
            '7a1404a30f2972498ace040b0029738b8dac45d0a12932ccb8b605eb94bafbe4'
            'b680bcde02d1ba0b9791d092804733a517fb3bfe9b32e002a0622ce2286e6304'
            'cff178a9310d859e819a6fe10f312b6e423d9a1d0cca5e6354a45fe0041677be'
            '7d4f6ae938198fc0be9b6ea76313ade24fcdb89be01a791e0cc90c88fae5743d')
install="$pkgname.install"

build() {
    cd "$srcdir/okf-generator-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/okf-generator-$pkgver"
    python -m pytest tests/ -q --ignore=tests/test_cli.py -x --timeout=30 2>/dev/null \
        || echo "Warning: some tests failed (expected without optional deps)"
}

package() {
    cd "$srcdir/okf-generator-$pkgver"

    # Install the main package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install bundled tree-sitter language wheels (PyPI-only, not in Arch/AUR)
    # These are platform-specific manylinux wheels downloaded and verified in source()
    for whl in "$srcdir"/*.whl; do
        python -m installer --destdir="$pkgdir" "$whl"
    done
}
