#!/usr/bin/env bash
set -euo pipefail

# ─── Config ──────────────────────────────────────────────────────────────────
QRDV="./qrdv"
TMP=$(mktemp -d)
PASS=0
FAIL=0
SKIP=0

# ─── Helpers ─────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
DIM='\033[2m'
BOLD='\033[1m'
RESET='\033[0m'

cleanup() {
    rm -rf "$TMP"
}
trap cleanup EXIT

pass() {
    PASS=$((PASS + 1))
    echo -e "  ${GREEN}✓${RESET} $1"
}

fail() {
    FAIL=$((FAIL + 1))
    echo -e "  ${RED}✗${RESET} $1"
    if [[ -n "${2:-}" ]]; then
        echo -e "    ${DIM}$2${RESET}"
    fi
}

skip() {
    SKIP=$((SKIP + 1))
    echo -e "  ${YELLOW}○${RESET} $1 ${DIM}(skipped)${RESET}"
}

header() {
    echo ""
    echo -e "${CYAN}${BOLD}── $1 ──${RESET}"
}

# Encode → decode → diff
roundtrip() {
    local label="$1"
    local input="$2"
    local extra_encode="${3:-}"
    local extra_decode="${4:-}"
    local mp4="$TMP/$(echo "$label" | tr ' ' '_').mp4"
    local output="$TMP/$(echo "$label" | tr ' ' '_')_out"

    if $QRDV encode -i "$input" -o "$mp4" $extra_encode >/dev/null 2>&1; then
        if $QRDV decode -i "$mp4" -o "$output" $extra_decode >/dev/null 2>&1; then
            if diff -q "$input" "$output" >/dev/null 2>&1; then
                pass "$label"
            else
                fail "$label" "output differs from input"
            fi
        else
            fail "$label" "decode failed"
        fi
    else
        fail "$label" "encode failed"
    fi
}

# ─── Preflight ───────────────────────────────────────────────────────────────
header "Preflight"

if [[ ! -x "$QRDV" ]]; then
    echo -e "${RED}Error: $QRDV not found or not executable${RESET}"
    echo "Run: cargo build --release && cp target/release/qrdv ."
    exit 1
fi
pass "binary exists"

if ! command -v ffmpeg &>/dev/null; then
    echo -e "${RED}Error: ffmpeg not found${RESET}"
    exit 1
fi
pass "ffmpeg available"

# ─── Generate test files ────────────────────────────────────────────────────
header "Setup"

# Tiny text file
echo "Hello, qrdv!" > "$TMP/tiny.txt"
pass "tiny.txt (13 bytes)"

# Small text file
head -c 1024 /dev/urandom | base64 > "$TMP/small.txt"
pass "small.txt (~1.4 KB)"

# Medium binary file
dd if=/dev/urandom of="$TMP/medium.bin" bs=1024 count=32 2>/dev/null
pass "medium.bin (32 KB)"

# Larger binary file
dd if=/dev/urandom of="$TMP/large.bin" bs=1024 count=128 2>/dev/null
pass "large.bin (128 KB)"

# Empty-ish file (single byte)
printf '\x42' > "$TMP/single_byte.bin"
pass "single_byte.bin (1 byte)"

# File with null bytes
dd if=/dev/zero of="$TMP/zeros.bin" bs=1 count=512 2>/dev/null
pass "zeros.bin (512 bytes null)"

# ─── Basic round-trips ──────────────────────────────────────────────────────
header "Basic Round-trips"

roundtrip "tiny text file" "$TMP/tiny.txt"
roundtrip "small text file" "$TMP/small.txt"
roundtrip "medium binary file" "$TMP/medium.bin" "-r 1080p"
roundtrip "single byte file" "$TMP/single_byte.bin"
roundtrip "null bytes file" "$TMP/zeros.bin"

# ─── Encryption ─────────────────────────────────────────────────────────────
header "Encryption"

roundtrip "encrypt tiny" "$TMP/tiny.txt" "-k secret123" "-k secret123"
roundtrip "encrypt small" "$TMP/small.txt" "-k mypassphrase" "-k mypassphrase"
roundtrip "encrypt medium" "$TMP/medium.bin" "-k hunter2" "-k hunter2"
roundtrip "encrypt large" "$TMP/large.bin" "-k p@ssw0rd!" "-k p@ssw0rd!"

# ─── Wrong key ──────────────────────────────────────────────────────────────
header "Wrong Key Rejection"

MP4_ENC="$TMP/encrypted_test.mp4"
$QRDV encode -i "$TMP/small.txt" -o "$MP4_ENC" -k "correct_key" >/dev/null 2>&1

if ! $QRDV decode -i "$MP4_ENC" -o "$TMP/wrong_key_out" -k "wrong_key" >/dev/null 2>&1; then
    pass "wrong key rejected"
else
    if ! diff -q "$TMP/small.txt" "$TMP/wrong_key_out" >/dev/null 2>&1; then
        pass "wrong key produces corrupted output"
    else
        fail "wrong key not rejected" "decode succeeded with wrong key and output matches"
    fi
fi

# ─── Missing key ────────────────────────────────────────────────────────────
if ! $QRDV decode -i "$MP4_ENC" -o "$TMP/no_key_out" >/dev/null 2>&1; then
    pass "missing key rejected for encrypted video"
else
    fail "missing key not rejected" "decode succeeded without key on encrypted video"
fi

# ─── Unneeded key warning ───────────────────────────────────────────────────
MP4_PLAIN="$TMP/plain_test.mp4"
$QRDV encode -i "$TMP/tiny.txt" -o "$MP4_PLAIN" >/dev/null 2>&1

if $QRDV decode -i "$MP4_PLAIN" -o "$TMP/unneeded_key_out" -k "not_needed" >/dev/null 2>&1; then
    if diff -q "$TMP/tiny.txt" "$TMP/unneeded_key_out" >/dev/null 2>&1; then
        pass "unneeded key ignored gracefully"
    else
        fail "unneeded key corrupted output"
    fi
else
    fail "unneeded key caused decode failure"
fi

# ─── Resolutions ─────────────────────────────────────────────────────────────
header "Resolutions"

for res in 480p 720p 1080p 1440p 4k; do
    roundtrip "resolution $res" "$TMP/tiny.txt" "-r $res"
done

# ─── Error Correction Levels ────────────────────────────────────────────────
header "Error Correction Levels"

for ec in low medium quartile high; do
    roundtrip "ec level $ec" "$TMP/small.txt" "-e $ec"
done

# ─── Processing Modes ───────────────────────────────────────────────────────
header "Processing Modes"

roundtrip "parallel encode + decode" "$TMP/small.txt" "-m parallel" "-m parallel"
roundtrip "standard encode + decode" "$TMP/small.txt" "-m standard" "-m standard"
roundtrip "parallel encode, standard decode" "$TMP/small.txt" "-m parallel" "-m standard"
roundtrip "standard encode, parallel decode" "$TMP/small.txt" "-m standard" "-m parallel"

# ─── FPS variations ─────────────────────────────────────────────────────────
header "FPS Variations"

roundtrip "fps 1" "$TMP/small.txt" "--fps 1"
roundtrip "fps 5" "$TMP/small.txt" "--fps 5"
roundtrip "fps 10" "$TMP/small.txt" "--fps 10"

# ─── Combined options ───────────────────────────────────────────────────────
header "Combined Options"

roundtrip "4k + low ec + encrypt + standard" "$TMP/small.txt" \
    "-r 4k -e low -k combo_test --fps 1 -m standard" \
    "-k combo_test -m standard"

roundtrip "480p + high ec + encrypt + parallel" "$TMP/small.txt" \
    "-r 480p -e high -k combo2 --fps 5 -m parallel" \
    "-k combo2 -m parallel"

# ─── CLI help ────────────────────────────────────────────────────────────────
header "CLI"

if $QRDV --help >/dev/null 2>&1; then
    pass "qrdv --help"
else
    fail "qrdv --help"
fi

if $QRDV encode --help >/dev/null 2>&1; then
    pass "qrdv encode --help"
else
    fail "qrdv encode --help"
fi

if $QRDV decode --help >/dev/null 2>&1; then
    pass "qrdv decode --help"
else
    fail "qrdv decode --help"
fi

if $QRDV --version >/dev/null 2>&1; then
    pass "qrdv --version"
else
    fail "qrdv --version"
fi

# ─── Error cases ─────────────────────────────────────────────────────────────
header "Error Cases"

if ! $QRDV encode -i /nonexistent -o "$TMP/err.mp4" >/dev/null 2>&1; then
    pass "encode nonexistent input fails"
else
    fail "encode nonexistent input should fail"
fi

if ! $QRDV decode -i /nonexistent -o "$TMP/err_out" >/dev/null 2>&1; then
    pass "decode nonexistent input fails"
else
    fail "decode nonexistent input should fail"
fi

# Corrupt MP4
echo "not a real video" > "$TMP/corrupt.mp4"
if ! $QRDV decode -i "$TMP/corrupt.mp4" -o "$TMP/corrupt_out" >/dev/null 2>&1; then
    pass "decode corrupt mp4 fails"
else
    fail "decode corrupt mp4 should fail"
fi

# ─── Large file (optional) ──────────────────────────────────────────────────
header "Large File"

roundtrip "large binary 128KB" "$TMP/large.bin" "-r 1080p"
roundtrip "large binary 128KB encrypted" "$TMP/large.bin" "-r 1080p -k bigfile" "-k bigfile"

# ─── Results ─────────────────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}═══════════════════════════════════════${RESET}"
TOTAL=$((PASS + FAIL + SKIP))
echo -e "  ${GREEN}${PASS} passed${RESET}  ${RED}${FAIL} failed${RESET}  ${YELLOW}${SKIP} skipped${RESET}  ${DIM}(${TOTAL} total)${RESET}"
echo -e "${BOLD}═══════════════════════════════════════${RESET}"
echo ""

if [[ $FAIL -gt 0 ]]; then
    exit 1
fi
