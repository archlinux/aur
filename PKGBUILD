# Maintainer: Julian Houba <info@craftingdragon.ch>
pkgname=opengrep
pkgver=1.26.0
pkgrel=1
_memprof_limits_commit=c2cced325a93d2271379f0712db85867b29dbee1
_opam_switch_stamp=3
pkgdesc="Lightweight static analysis for many languages. Find bug variants with patterns that look like source code. Fork of semgrep"
arch=('x86_64' 'aarch64')
url="https://github.com/opengrep/opengrep"
license=('LGPL-2.1-only')

depends=(
  'gmp'
  'libev'
  'pcre'
  'pcre2'
  'python'
  'python-attrs'
  'python-boltons'
  'python-click-option-group'
  'python-click'
  'python-colorama'
  'python-glom'
  'python-jsonschema'
  'python-packaging'
  'python-peewee'
  'python-requests'
  'python-rich'
  'python-ruamel-yaml'
  'python-typing_extensions'
  'python-urllib3'
  'python-wcmatch'
  'tree-sitter'
)
makedepends=(
  'dune'
  'git'
  'ocaml'
  'opam'
  'pkgconf'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_submodules=(
  'OSS/cli/src/semgrep/semgrep_interfaces|cli/src/semgrep/semgrep_interfaces|semgrep-interfaces|https://github.com/opengrep/semgrep-interfaces.git|977c2a9b30e472c303930104414184c76bbadda8'
  'languages/apex/tree-sitter/semgrep-apex|languages/apex/tree-sitter/semgrep-apex|semgrep-apex|https://github.com/opengrep/semgrep-apex.git|f2a235f997379033a8c64f0962d5ef1252629a0a'
  'OSS/languages/bash/tree-sitter/semgrep-bash|languages/bash/tree-sitter/semgrep-bash|semgrep-bash|https://github.com/opengrep/semgrep-bash|e6f3944f59b684b212a37bdec6b113621a1ad9ea'
  'OSS/languages/cairo/tree-sitter/semgrep-cairo|languages/cairo/tree-sitter/semgrep-cairo|semgrep-cairo|https://github.com/opengrep/semgrep-cairo|3e4d0ded8fc62dbb03232193721bf6bb376bfc62'
  'OSS/languages/circom/tree-sitter/semgrep-circom|languages/circom/tree-sitter/semgrep-circom|semgrep-circom|https://github.com/opengrep/semgrep-circom.git|66a0ff265c38a31240162d0011190b5bdd85efd5'
  'OSS/languages/cpp/tree-sitter/semgrep-cpp|languages/cpp/tree-sitter/semgrep-cpp|semgrep-cpp|https://github.com/opengrep/semgrep-cpp|8625a5341aebb93c62eb953f6a66fc1083dffe84'
  'OSS/languages/crystal/tree-sitter/opengrep-crystal|languages/crystal/tree-sitter/opengrep-crystal|opengrep-crystal|https://github.com/opengrep/opengrep-crystal|f279484792c259278c4e135e8f1048bbcea7c358'
  'OSS/languages/csharp/tree-sitter/semgrep-c-sharp|languages/csharp/tree-sitter/semgrep-c-sharp|semgrep-c-sharp|https://github.com/opengrep/semgrep-c-sharp|e507514adbbcd443d05deb6db78022a9aec065f2'
  'OSS/languages/dart/tree-sitter/semgrep-dart|languages/dart/tree-sitter/semgrep-dart|semgrep-dart|https://github.com/opengrep/semgrep-dart.git|cb3c48321fdab5485d2c1f92c99c78425543e59d'
  'OSS/languages/dockerfile/tree-sitter/semgrep-dockerfile|languages/dockerfile/tree-sitter/semgrep-dockerfile|semgrep-dockerfile|https://github.com/opengrep/semgrep-dockerfile|ac8a9ff1c6bd9acca3f936da55dab0292fd4ce58'
  'OSS/languages/elixir/tree-sitter/semgrep-elixir|languages/elixir/tree-sitter/semgrep-elixir|semgrep-elixir|https://github.com/opengrep/semgrep-elixir.git|681f90052720f4bc1c2fd2c2547771f6029917f0'
  'OSS/languages/go/tree-sitter/semgrep-go|languages/go/tree-sitter/semgrep-go|semgrep-go|https://github.com/opengrep/semgrep-go|b36632089866c9223ce5bd31a0353627a48f50f9'
  'OSS/languages/tree-sitter-lang/semgrep-hack|languages/hack/tree-sitter/semgrep-hack|semgrep-hack|https://github.com/opengrep/semgrep-hack.git|f1adb0ae2b0e77a5181de5a98f55055435b0aa57'
  'OSS/languages/html/tree-sitter/semgrep-html|languages/html/tree-sitter/semgrep-html|semgrep-html|https://github.com/opengrep/semgrep-html.git|827d34d593016cd34324f3a3b46248022cf613b6'
  'OSS/languages/java/tree-sitter/semgrep-java|languages/java/tree-sitter/semgrep-java|semgrep-java|https://github.com/opengrep/semgrep-java|7b6cb9d41b74a6f21133cc9a9cc0a2e60ff2af6f'
  'OSS/languages/jsonnet/tree-sitter/semgrep-jsonnet|languages/jsonnet/tree-sitter/semgrep-jsonnet|semgrep-jsonnet|https://github.com/opengrep/semgrep-jsonnet.git|a9e8d4c35acfa457e6649f4f54c467f5575e6777'
  'OSS/languages/julia/tree-sitter/semgrep-julia|languages/julia/tree-sitter/semgrep-julia|semgrep-julia|https://github.com/opengrep/semgrep-julia.git|31bcd2dcaa9beb1580f60c81a133037f7fad0a40'
  'OSS/languages/kotlin/tree-sitter/semgrep-kotlin|languages/kotlin/tree-sitter/semgrep-kotlin|semgrep-kotlin|https://github.com/opengrep/semgrep-kotlin.git|97203482e0aa1a88f25bfe4880fc05230524eb5a'
  'OSS/languages/lisp/tree-sitter/semgrep-clojure|languages/lisp/tree-sitter/semgrep-clojure|semgrep-clojure|https://github.com/opengrep/semgrep-clojure.git|0c4985d4f26c019ca15ff5ea7b8b525f4128e0df'
  'OSS/languages/lua/tree-sitter/semgrep-lua|languages/lua/tree-sitter/semgrep-lua|semgrep-lua|https://github.com/opengrep/semgrep-lua|073f283a0fa4144f941199e869fd787d8e3ce338'
  'OSS/languages/move-on-aptos/tree-sitter/semgrep-move-on-aptos|languages/move_on_aptos/tree-sitter/semgrep-move-on-aptos|semgrep-move-on-aptos|https://github.com/opengrep/semgrep-move-on-aptos.git|74276d40735ccb584d341144308f84c31b0384f9'
  'OSS/languages/move_on_sui/tree-sitter/semgrep-move-on-sui|languages/move_on_sui/tree-sitter/semgrep-move-on-sui|semgrep-move-on-sui|https://github.com/opengrep/semgrep-move-on-sui.git|f1fc8f468c21e26d0c3dfafdea7e9888bdfb97e8'
  'OSS/languages/ocaml/tree-sitter/semgrep-ocaml|languages/ocaml/tree-sitter/semgrep-ocaml|semgrep-ocaml|https://github.com/opengrep/semgrep-ocaml.git|ee015c07fc8b99250875d796da5aec0888eaa8fe'
  'OSS/languages/php/tree-sitter/semgrep-php|languages/php/tree-sitter/semgrep-php|semgrep-php|https://github.com/opengrep/semgrep-php|0b9dd47725c12481017485d9882e375fda26e142'
  'OSS/languages/promql/tree-sitter/semgrep-promql|languages/promql/tree-sitter/semgrep-promql|semgrep-promql|https://github.com/opengrep/semgrep-promql.git|a6ac8bf5a35e2078b50098cbb5f64bf259c31875'
  'OSS/languages/protobuf/tree-sitter/semgrep-proto|languages/protobuf/tree-sitter/semgrep-proto|semgrep-proto|https://github.com/opengrep/semgrep-proto.git|25bae8f9d0b9f56f4914fd3d2adcee754fd241d8'
  'OSS/languages/python/tree-sitter/semgrep-python|languages/python/tree-sitter/semgrep-python|semgrep-python|https://github.com/opengrep/semgrep-python.git|444327263390b07b66bb13c0a91848c7767d9af2'
  'OSS/languages/ql/tree-sitter/semgrep-ql|languages/ql/tree-sitter/semgrep-ql|semgrep-ql|https://github.com/opengrep/semgrep-ql|853a990a50b71f0ca24e3732dccff5c8c54e874d'
  'OSS/languages/r/tree-sitter/semgrep-r|languages/r/tree-sitter/semgrep-r|semgrep-r|https://github.com/opengrep/semgrep-r|2c556b67422a627e0325589f71fc1394b5750c98'
  'OSS/languages/ruby/tree-sitter/semgrep-ruby|languages/ruby/tree-sitter/semgrep-ruby|semgrep-ruby|https://github.com/opengrep/semgrep-ruby.git|bf09252137a27dc29a8d9da82d4d5a4527bda46b'
  'OSS/languages/rust/tree-sitter/semgrep-rust|languages/rust/tree-sitter/semgrep-rust|semgrep-rust|https://github.com/opengrep/semgrep-rust|fb6c73fbe4f34592fbbd0ce0f825e224533d47e7'
  'OSS/languages/solidity/tree-sitter/semgrep-solidity|languages/solidity/tree-sitter/semgrep-solidity|semgrep-solidity|https://github.com/opengrep/semgrep-solidity.git|e101c0c6c8c86bd5ff02f1d3a737cb3e3bebe498'
  'OSS/languages/swift/tree-sitter/semgrep-swift|languages/swift/tree-sitter/semgrep-swift|semgrep-swift|https://github.com/opengrep/semgrep-swift.git|61d1550d1b4aee70f7e00457d3121e4f1d3c0d47'
  'OSS/languages/terraform/tree-sitter/semgrep-hcl|languages/terraform/tree-sitter/semgrep-hcl|semgrep-hcl|https://github.com/opengrep/semgrep-hcl|e42e9d924de848c784e4ab46c571bff5145d245e'
  'OSS/languages/typescript/tree-sitter/semgrep-tsx|languages/typescript/tree-sitter/semgrep-tsx|semgrep-tsx|https://github.com/opengrep/semgrep-tsx|a5799ce5d762168fe17c94b86ad5f77ee13d2138'
  'OSS/languages/typescript/tree-sitter/semgrep-typescript|languages/typescript/tree-sitter/semgrep-typescript|semgrep-typescript|https://github.com/opengrep/semgrep-typescript|6c288cd9c2fecf05556be02d540814aa5456ad2b'
  'OSS/libs/ocaml-tree-sitter-core|libs/ocaml-tree-sitter-core|ocaml-tree-sitter-core|https://github.com/opengrep/ocaml-tree-sitter-core.git|1392efc21e60d5acde72d0d1c6586f5692fedace'
  'OSS/libs/pcre2|libs/pcre2|pcre2-ocaml|https://github.com/semgrep/pcre2-ocaml|4e0a44486bb518b7a24ca11286c4b03a8d51e17e'
  'OSS/libs/testo|libs/testo|testo|https://github.com/semgrep/testo.git|99a0d4f08d9cbabc87d10da94a534ce8a1220cd9'
  'OSS/tests/semgrep-rules|tests/semgrep-rules|semgrep-rules|https://github.com/semgrep/semgrep-rules.git|f0a382de1184139c5a356eb64ccd9bdfcc8ce526'
)

source=(
  "${pkgname}::git+https://github.com/opengrep/opengrep.git#tag=v${pkgver}"
  "memprof-limits::git+https://gitlab.com/dimitris-m/memprof-limits.git#commit=${_memprof_limits_commit}"
)

sha256sums=(
    'SKIP'
    'SKIP'
)

for _submodule in "${_submodules[@]}"; do
  IFS='|' read -r _name _path _repo _url _commit <<< "${_submodule}"
  source+=("${_repo}::git+${_url}#commit=${_commit}")
  sha256sums+=('SKIP')
done

prepare() {
  cd "${pkgname}"

  local _commit _name _path _repo _submodule _url
  local -a _submodule_paths=()

  git submodule init

  for _submodule in "${_submodules[@]}"; do
    IFS='|' read -r _name _path _repo _url _commit <<< "${_submodule}"
    git config "submodule.${_name}.url" "${srcdir}/${_repo}"
    _submodule_paths+=("${_path}")
  done

  git -c protocol.file.allow=always submodule update --init --force "${_submodule_paths[@]}"

  sed -i \
    '/^# Remove all symbols with GNU strip/,/^\tstrip bin\/opengrep-core$(EXE)$/d' \
    Makefile

  cd libs/ocaml-tree-sitter-core
  ./configure --prefix /usr
  sed -i \
    -e 's|^PATH := .*|PATH := $(PATH):$(TREESITTER_BINDIR)|' \
    -e 's|^PATH=.*|PATH=$PATH:$TREESITTER_BINDIR|' \
    tree-sitter-config.mk tree-sitter-config.sh
}

build() {
  cd "${pkgname}"

  export OPAMROOT="${srcdir}/opam-root"
  export OPAMYES=1
  export OPAMERRLOGLEN=0

  local _switch_stamp= _system_ocamlver
  _system_ocamlver="$(ocamlc -version)"

  if [[ ! -d "${OPAMROOT}" ]]; then
    opam init --bare --disable-sandboxing --no-setup
  fi

  if opam switch list --short | grep -Fxq "${pkgname}"; then
    if [[ -f "${OPAMROOT}/${pkgname}/.opengrep-package-switch" ]]; then
      _switch_stamp="$(<"${OPAMROOT}/${pkgname}/.opengrep-package-switch")"
    fi
    if [[ "$(opam exec --switch="${pkgname}" -- ocamlc -version 2>/dev/null)" != "${_system_ocamlver}" ]] || \
       [[ "${_switch_stamp}" != "${_opam_switch_stamp}" ]]; then
      opam switch remove -y "${pkgname}"
    fi
  fi

  if ! opam switch list --short | grep -Fxq "${pkgname}"; then
    opam switch create "${pkgname}" ocaml-system
  fi

  export OCAMLPATH="${OPAMROOT}/${pkgname}/lib"

  opam pin --switch="${pkgname}" add -n -k path \
    memprof-limits.dev "${srcdir}/memprof-limits"

  LDFLAGS= OPAMSOLVERTIMEOUT=1200 opam install --switch="${pkgname}" \
    --assume-depexts \
    --ignore-pin-depends \
    --deps-only \
    ./opam/semgrep.opam \
    ./libs/ocaml-tree-sitter-core/tree-sitter.opam

  printf '%s\n' "${_opam_switch_stamp}" > "${OPAMROOT}/${pkgname}/.opengrep-package-switch"

  opam exec --switch="${pkgname}" -- make core

  install -Dm755 bin/opengrep-core \
    cli/src/semgrep/bin/opengrep-core

  cd cli
  rm -rf dist
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}"

  local _lang="${LANG-}" _lang_is_set="${LANG+x}" _status

  export OPAMROOT="${srcdir}/opam-root"
  export OPAMYES=1
  export OPAMERRLOGLEN=0
  export OCAMLPATH="${OPAMROOT}/${pkgname}/lib"
  export LANG=C # Needed for e2e and git tests to pass

  if opam exec --switch="${pkgname}" -- make core-test; then
    _status=0
  else
    _status=$?
  fi

  if [[ -n "${_lang_is_set}" ]]; then
    export LANG="${_lang}"
  else
    unset LANG
  fi

  return "${_status}"
}

package() {
  cd "${pkgname}/cli"

  local -a _wheels
  shopt -s nullglob
  _wheels=(dist/*.whl)
  if (( ${#_wheels[@]} != 1 )); then
    error "Expected exactly one wheel in cli/dist, found ${#_wheels[@]}"
    return 1
  fi

  python -m installer --destdir="${pkgdir}" "${_wheels[0]}"

  cd ..
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
