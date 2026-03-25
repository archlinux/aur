#!/usr/bin/env bash
set -euo pipefail

# Verify DKMS and upstream patches produce identical code changes.
#
# Both patch sets are derived from the same git branch but target different
# bases (DKMS: kernel tarball + mt7902, upstream: wireless-next). This script
# verifies they introduce the same code changes by comparing the added/removed
# lines (stripping context and path differences).
#
# Usage:
#   ./verify-patches.sh                    # verify all patches
#   ./verify-patches.sh --upstream-only    # just verify upstream matches git

DKMS_DIR="$(cd "$(dirname "$0")" && pwd)"
KERNEL_TREE="${KERNEL_TREE:-$HOME/repos/personal/linux-stable}"
DKMS_BRANCH="${DKMS_BRANCH:-mt7927-wifi-dkms}"
BASE_REF="${BASE_REF:-dkms-base}"
MT76_SUBDIR="drivers/net/wireless/mediatek/mt76"

# Auto-detect latest upstream branch if not set
_detect_upstream_branch() {
	git -C "$KERNEL_TREE" for-each-ref --format='%(refname:short)' \
		'refs/heads/mt7927-wifi-support-v*' | sort -V | tail -1
}
UPSTREAM_BRANCH="${UPSTREAM_BRANCH:-$(_detect_upstream_branch)}"

if [[ -z "$UPSTREAM_BRANCH" ]]; then
	echo "ERROR: no mt7927-wifi-support-v* branch found in $KERNEL_TREE"
	exit 1
fi

upstream_only=false
for arg in "$@"; do
	case "$arg" in
	--upstream-only) upstream_only=true ;;
	esac
done

errors=0

# Extract code changes from a git diff or patch file.
# Groups by filename, preserves +/- polarity, sorts within each file group.
_extract_changes() {
	local source="$1" # "git:<commit>" or file path
	local raw

	if [[ "$source" == git:* ]]; then
		local commit="${source#git:}"
		raw=$(git -C "$KERNEL_TREE" diff "${commit}^..$commit" \
			-- "$MT76_SUBDIR/" 2>/dev/null || true)
	else
		raw=$(cat "$source")
	fi

	# Output: "filename:polarity:line" sorted per file
	echo "$raw" | awk '
		/^diff --git/ {
			# Extract filename from b/ path, strip any mt76 subdir prefix
			fname = $NF
			sub(/^b\//, "", fname)
			sub(/^drivers\/net\/wireless\/mediatek\/mt76\//, "", fname)
			next
		}
		/^\+[^+]/ { print fname ":" $0 }
		/^-[^-]/  { print fname ":" $0 }
	' | sort
}

# ── Step 0: Staleness check ─────────────────────────────────────────
upstream_patches_dir="$DKMS_DIR/linux-stable/patches"
if [[ ! -d "$upstream_patches_dir" ]]; then
	echo "ERROR: upstream patches directory not found: $upstream_patches_dir"
	exit 1
fi

tip_file="$upstream_patches_dir/.git-tip"
actual_tip=$(git -C "$KERNEL_TREE" rev-parse "$UPSTREAM_BRANCH")
if [[ -f "$tip_file" ]]; then
	recorded_tip=$(cat "$tip_file")
	if [[ "$recorded_tip" != "$actual_tip" ]]; then
		echo "WARNING: upstream patches may be stale"
		echo "  Recorded tip: ${recorded_tip:0:12}"
		echo "  Current tip:  ${actual_tip:0:12}"
		echo "  Re-run: devtool patch-regen --cwd linux-stable"
		echo ""
	fi
else
	echo "NOTE: no .git-tip file found - staleness check skipped"
	echo "  (will be created by future patch-regen runs)"
	echo ""
fi

# ── Step 1: Verify upstream patches match git branch ────────────────
echo "==> Verifying upstream patches match git branch ($UPSTREAM_BRANCH)..."

# Use DKMS branch commit count as the authoritative series size.
# Both branches must have the same number of patches.
dkms_count=$(git -C "$KERNEL_TREE" rev-list --count "$DKMS_BRANCH" --not "$BASE_REF")
mapfile -t upstream_commits < <(
	git -C "$KERNEL_TREE" log --reverse --format='%H' \
		"${UPSTREAM_BRANCH}~${dkms_count}..${UPSTREAM_BRANCH}"
)

upstream_patch_count=$(find "$upstream_patches_dir" -name '*.patch' ! -name '0000-*' | wc -l)
if ((upstream_patch_count != ${#upstream_commits[@]})); then
	echo "FAIL: upstream patch count ($upstream_patch_count) != git commit count (${#upstream_commits[@]})"
	errors=$((errors + 1))
fi

for i in "${!upstream_commits[@]}"; do
	n=$((i + 1))
	nn=$(printf '%04d' "$n")
	commit=${upstream_commits[$i]}
	subject=$(git -C "$KERNEL_TREE" log -1 --format='%s' "$commit")

	patch_file=$(find "$upstream_patches_dir" -name "${nn}-*.patch" | head -1)
	if [[ -z "$patch_file" ]]; then
		echo "  FAIL: [$nn] no patch file for: $subject"
		errors=$((errors + 1))
		continue
	fi

	git_changes=$(_extract_changes "git:$commit")
	patch_changes=$(_extract_changes "$patch_file")

	if [[ "$git_changes" == "$patch_changes" ]]; then
		echo "  [$nn] OK: $subject"
	else
		echo "  [$nn] FAIL: upstream patch differs from git"
		echo "       Patch: $(basename "$patch_file")"
		diff <(echo "$git_changes") <(echo "$patch_changes") | head -20
		errors=$((errors + 1))
	fi
done

if $upstream_only; then
	if ((errors > 0)); then
		echo "FAILED: $errors error(s)"
		exit 1
	fi
	echo "All upstream patches match git. Done."
	exit 0
fi

# ── Step 2: Verify DKMS patches match git branch ────────────────────
echo ""
echo "==> Verifying DKMS patches match git branch ($DKMS_BRANCH)..."

mapfile -t dkms_commits < <(
	git -C "$KERNEL_TREE" log --reverse --format='%H' \
		"$DKMS_BRANCH" --not "$BASE_REF"
)

dkms_patch_count=$(find "$DKMS_DIR" -maxdepth 1 -name 'mt7927-wifi-*.patch' | wc -l)
if ((dkms_patch_count != ${#dkms_commits[@]})); then
	echo "FAIL: DKMS patch count ($dkms_patch_count) != git commit count (${#dkms_commits[@]})"
	errors=$((errors + 1))
fi

for i in "${!dkms_commits[@]}"; do
	n=$((i + 1))
	nn=$(printf '%02d' "$n")
	commit=${dkms_commits[$i]}
	subject=$(git -C "$KERNEL_TREE" log -1 --format='%s' "$commit")

	patch_file=$(find "$DKMS_DIR" -maxdepth 1 -name "mt7927-wifi-${nn}-*.patch" | head -1)
	if [[ -z "$patch_file" ]]; then
		echo "  FAIL: [$nn] no DKMS patch for: $subject"
		errors=$((errors + 1))
		continue
	fi

	git_changes=$(_extract_changes "git:$commit")
	patch_changes=$(_extract_changes "$patch_file")

	if [[ "$git_changes" == "$patch_changes" ]]; then
		echo "  [$nn] OK: $subject"
	else
		echo "  [$nn] FAIL: DKMS patch differs from git"
		echo "       Patch: $(basename "$patch_file")"
		diff <(echo "$git_changes") <(echo "$patch_changes") | head -20
		errors=$((errors + 1))
	fi
done

# ── Step 3: Cross-check upstream vs DKMS by subject match ───────────
# DKMS patches may contain additional lines from mt7902 merge resolution.
# Match by commit subject, not index position.
echo ""
echo "==> Cross-checking upstream vs DKMS patches..."

for i in "${!dkms_commits[@]}"; do
	n=$((i + 1))
	nn_dk=$(printf '%02d' "$n")
	dkms_commit=${dkms_commits[$i]}
	subject=$(git -C "$KERNEL_TREE" log -1 --format='%s' "$dkms_commit")

	# Find matching upstream commit by subject
	up_commit=""
	for uc in "${upstream_commits[@]}"; do
		up_subj=$(git -C "$KERNEL_TREE" log -1 --format='%s' "$uc")
		if [[ "$up_subj" == "$subject" ]]; then
			up_commit="$uc"
			break
		fi
	done

	if [[ -z "$up_commit" ]]; then
		echo "  [$n] SKIP: no upstream match for: $subject"
		continue
	fi

	# Find corresponding patch files
	nn_up=""
	for j in "${!upstream_commits[@]}"; do
		if [[ "${upstream_commits[$j]}" == "$up_commit" ]]; then
			nn_up=$(printf '%04d' "$((j + 1))")
			break
		fi
	done

	up_file=$(find "$upstream_patches_dir" -name "${nn_up}-*.patch" | head -1)
	dk_file=$(find "$DKMS_DIR" -maxdepth 1 -name "mt7927-wifi-${nn_dk}-*.patch" | head -1)

	if [[ -z "$up_file" ]] || [[ -z "$dk_file" ]]; then
		continue
	fi

	up_changes=$(_extract_changes "$up_file")
	dk_changes=$(_extract_changes "$dk_file")

	if [[ "$up_changes" == "$dk_changes" ]]; then
		echo "  [$n] OK"
	else
		# Upstream must be a subset of DKMS (DKMS may have extra
		# lines from mt7902 conflict resolution)
		missing=$(comm -23 <(echo "$up_changes") <(echo "$dk_changes"))
		extra=$(comm -13 <(echo "$up_changes") <(echo "$dk_changes"))
		if [[ -z "$missing" ]]; then
			extra_count=$(echo "$extra" | grep -c . || true)
			echo "  [$n] OK (DKMS has $extra_count extra lines from merge resolution)"
		else
			echo "  [$n] FAIL: upstream lines missing from DKMS patch"
			echo "$missing" | head -10
			errors=$((errors + 1))
		fi
	fi
done

echo ""
if ((errors > 0)); then
	echo "FAILED: $errors error(s)"
	exit 1
fi
echo "All patches verified. Upstream, DKMS, and git branch are consistent."
