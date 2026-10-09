#!/bin/bash
set -euo pipefail

# Read the generated registry, not the latest GitHub manifest. Match complete
# declarations across whitespace changes, and reject unparsed grammar entries
# before downloading anything if upstream changes the constructor/schema.
metadata=$(<"$1")
dest=$2
release_re='pub[[:space:]]+const[[:space:]]+RELEASE[[:space:]]*:[[:space:]]*&str[[:space:]]*=[[:space:]]*"([[:alnum:]_.-]+)"[[:space:]]*;'
if [[ ! $metadata =~ $release_re ]]; then
    printf 'Cannot extract grammar RELEASE from %s\n' "$1" >&2
    exit 1
fi
release=${BASH_REMATCH[1]}
metadata=${metadata/"${BASH_REMATCH[0]}"/}

entry_re='pub[[:space:]]+static[[:space:]]+[[:alnum:]_]+[[:space:]]*:[[:space:]]*WasmGrammar[[:space:]]*=[[:space:]]*WasmGrammar::new\('
entry_re+='[[:space:]]*"[^"]+"[[:space:]]*,[[:space:]]*"[^"]+"[[:space:]]*,'
entry_re+='[[:space:]]*"([[:alnum:]_.-]+\.wasm)"[[:space:]]*,'
entry_re+='[[:space:]]*"([[:xdigit:]]{64})"[[:space:]]*,'
entry_re+='[[:space:]]*([0-9][0-9_]*)[[:space:]]*,?[[:space:]]*\)[[:space:]]*;'
files=() hashes=() sizes=()
while [[ $metadata =~ $entry_re ]]; do
    files+=("${BASH_REMATCH[1]}")
    hashes+=("${BASH_REMATCH[2]}")
    sizes+=("${BASH_REMATCH[3]//_/}")
    metadata=${metadata/"${BASH_REMATCH[0]}"/}
done
unparsed_re='pub[[:space:]]+static|WasmGrammar[[:space:]]*::|const[[:space:]]+RELEASE'
if (( ${#files[@]} == 0 )) || [[ $metadata =~ $unparsed_re ]]; then
    printf 'Unsupported grammar registry format in %s\n' "$1" >&2
    exit 1
fi

base="https://github.com/stencil-hq/wasm-grammars/releases/download/${release}"
mkdir -p "$dest"
compressed="$dest/download.zst.part"
part="$dest/download.wasm.part"
trap 'rm -f -- "$compressed" "$part"' EXIT

verify() {
    [[ -f $1 && $(stat -c %s -- "$1") == "$2" ]] &&
        printf '%s  %s\n' "$3" "$1" | sha256sum --check --status
}

for i in "${!files[@]}"; do
    file=${files[i]}
    if verify "$dest/$file" "${sizes[i]}" "${hashes[i]}"; then
        continue
    fi
    printf 'Fetching %s/%s.zst\n' "$release" "$file"
    curl --fail --location --silent --show-error --output "$compressed" "$base/$file.zst"
    zstd --decompress --stdout "$compressed" >"$part"
    if ! verify "$part" "${sizes[i]}" "${hashes[i]}"; then
        printf 'Grammar size or SHA-256 mismatch: %s\n' "$file" >&2
        exit 1
    fi
    mv -- "$part" "$dest/$file"
done

printf 'Verified %s grammars from %s\n' "${#files[@]}" "$release"
