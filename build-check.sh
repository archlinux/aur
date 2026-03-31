#!/usr/bin/env bash
set -euo pipefail

# Verify each commit in a kernel patch series builds independently.
#
# Checks out each commit, builds the relevant kernel module(s), and
# reports pass/fail. Ensures series is bisectable before submission.
#
# Usage:
#   ./build-check.sh wifi              # check WiFi series (mt76 modules)
#   ./build-check.sh bt                # check BT series (bluetooth modules)
#   ./build-check.sh wifi --quick      # stop on first failure
#   KDIR=/path/to/build ./build-check.sh wifi

KERNEL_TREE="${KERNEL_TREE:-$(cd "$(dirname "$0")/linux-stable" && pwd)}"
KDIR="${KDIR:-/lib/modules/$(uname -r)/build}"

# Detect LLVM from kernel config
_llvm=""
if grep -qs '^CONFIG_CC_IS_CLANG=y' "$KDIR/.config"; then
	_llvm="LLVM=1"
fi

_nproc=$(nproc)

# Module paths (stable across versions)
declare -A SERIES_MODULES SERIES_BASE
SERIES_MODULES[wifi]="drivers/net/wireless/mediatek/mt76"
SERIES_MODULES[bt]="drivers/bluetooth"
SERIES_BASE[wifi]=""  # auto-detected from b4 prep
SERIES_BASE[bt]="bt-base"

# Auto-detect the latest upstream branch by pattern
_detect_branch() {
	local pattern="$1"
	git -C "$KERNEL_TREE" for-each-ref --format='%(refname:short)' \
		"refs/heads/$pattern" | sort -V | tail -1
}

declare -A SERIES_BRANCH
SERIES_BRANCH[wifi]="$(_detect_branch 'mt7927-wifi-support-v*')"
SERIES_BRANCH[bt]="$(_detect_branch 'mt7927-bt-support*')"

# Allow explicit override via environment
SERIES_BRANCH[wifi]="${WIFI_BRANCH:-${SERIES_BRANCH[wifi]}}"
SERIES_BRANCH[bt]="${BT_BRANCH:-${SERIES_BRANCH[bt]}}"


# Parse arguments
series=""
quick=false
for arg in "$@"; do
	case "$arg" in
	wifi | bt) series="$arg" ;;
	--quick) quick=true ;;
	*)
		echo "Usage: $0 {wifi|bt} [--quick]"
		exit 1
		;;
	esac
done

if [[ -z "$series" ]]; then
	echo "Usage: $0 {wifi|bt} [--quick]"
	exit 1
fi

branch="${SERIES_BRANCH[$series]}"
module_dir="${SERIES_MODULES[$series]}"

# Determine base: try b4 prep metadata first, fall back to SERIES_BASE
base=""
_saved_branch=$(git -C "$KERNEL_TREE" symbolic-ref --short HEAD 2>/dev/null || true)
if git -C "$KERNEL_TREE" checkout "$branch" --quiet 2>/dev/null; then
	base=$(cd "$KERNEL_TREE" && b4 prep --show-info 2>/dev/null |
		grep '^base-commit:' | awk '{print $2}') || true
	if [[ -n "$_saved_branch" ]]; then
		git -C "$KERNEL_TREE" checkout "$_saved_branch" --quiet 2>/dev/null || true
	fi
fi
if [[ -z "$base" ]]; then
	base="${SERIES_BASE[$series]}"
fi

if ! git -C "$KERNEL_TREE" rev-parse --verify "$branch" &>/dev/null; then
	echo "ERROR: branch $branch not found in $KERNEL_TREE"
	exit 1
fi

if ! git -C "$KERNEL_TREE" rev-parse --verify "$base" &>/dev/null; then
	echo "ERROR: base ref $base not found"
	exit 1
fi

# Get ordered commits (only those touching the module directory)
mapfile -t commits < <(
	git -C "$KERNEL_TREE" log --reverse --format='%H' \
		"$branch" --not "$base" -- "$module_dir/"
)

if ((${#commits[@]} == 0)); then
	echo "No commits found on $branch above $base touching $module_dir/"
	exit 1
fi

echo "==> Build-checking $series series: ${#commits[@]} commits on $branch"
echo "    Module: $module_dir"
echo "    Kernel: $KDIR"
echo "    Toolchain: ${_llvm:-GCC}"
echo ""

# Save current branch to restore later
prev_ref=$(git -C "$KERNEL_TREE" symbolic-ref --short HEAD 2>/dev/null ||
	git -C "$KERNEL_TREE" rev-parse HEAD)

# Cleanup trap
_cleanup() {
	git -C "$KERNEL_TREE" checkout "$prev_ref" --quiet 2>/dev/null || true
}
trap _cleanup EXIT

errors=0
results=()

for i in "${!commits[@]}"; do
	n=$((i + 1))
	commit=${commits[$i]}
	subject=$(git -C "$KERNEL_TREE" log -1 --format='%s' "$commit")
	short=$(git -C "$KERNEL_TREE" rev-parse --short "$commit")

	git -C "$KERNEL_TREE" checkout "$commit" --quiet 2>/dev/null

	# Build
	build_rc=0
	build_out=$(make -C "$KDIR" M="$KERNEL_TREE/$module_dir" modules \
		$_llvm -j"$_nproc" 2>&1) || build_rc=$?

	# Check for actual compilation errors (ignore modpost/symbol warnings)
	has_error=false
	if ((build_rc != 0)); then
		# Filter out modpost warnings about unresolved symbols (expected for M= builds)
		real_errors=$(echo "$build_out" | grep -E '^.*:\d+:\d+: error:' || true)
		if [[ -n "$real_errors" ]]; then
			has_error=true
		fi
	fi

	if $has_error; then
		results+=("FAIL")
		printf "  [%d/%d] FAIL %s %s\n" "$n" "${#commits[@]}" "$short" "$subject"
		echo "$real_errors" | head -5 | sed 's/^/         /'
		errors=$((errors + 1))
		if $quick; then
			echo ""
			echo "Stopped at first failure (--quick)"
			break
		fi
	else
		results+=("PASS")
		printf "  [%d/%d] OK   %s %s\n" "$n" "${#commits[@]}" "$short" "$subject"
	fi

	# Clean build artifacts
	make -C "$KDIR" M="$KERNEL_TREE/$module_dir" clean -j"$_nproc" \
		$_llvm 2>/dev/null || true
done

echo ""
if ((errors > 0)); then
	echo "FAILED: $errors of ${#commits[@]} commits have build errors"
	exit 1
fi
echo "All ${#commits[@]} commits build independently."
