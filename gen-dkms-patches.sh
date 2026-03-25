#!/usr/bin/env bash
set -euo pipefail

# Generate DKMS WiFi patches from kernel tree commits.
#
# Creates a temp git repo from the kernel tarball + mt7902 patch, then applies
# each kernel commit's diff sequentially. The resulting diffs have exact line
# numbers for the DKMS build context (kernel.org + mt7902 + preceding patches).
#
# Usage:
#   ./gen-dkms-patches.sh              # regenerate all
#   ./gen-dkms-patches.sh 14           # regenerate just patch #14
#   ./gen-dkms-patches.sh 14 16 18     # regenerate specific patches
#   ./gen-dkms-patches.sh --dry-run    # verify patches apply, don't write
#   ./gen-dkms-patches.sh --rebase     # rebase DKMS branch from upstream, then generate

DKMS_DIR="$(cd "$(dirname "$0")" && pwd)"
KERNEL_TREE="${KERNEL_TREE:-$HOME/repos/personal/linux-stable}"
KERNEL_BRANCH="${KERNEL_BRANCH:-mt7927-wifi-dkms}"
MT76_SUBDIR="drivers/net/wireless/mediatek/mt76"

# Auto-detect latest upstream branch if not set
_detect_upstream_branch() {
	git -C "$KERNEL_TREE" for-each-ref --format='%(refname:short)' \
		'refs/heads/mt7927-wifi-support-v*' | sort -V | tail -1
}
UPSTREAM_BRANCH="${UPSTREAM_BRANCH:-$(_detect_upstream_branch)}"

# Parse arguments
dry_run=false
do_rebase=false
patches_to_gen=()
for arg in "$@"; do
	case "$arg" in
	--dry-run) dry_run=true ;;
	--rebase) do_rebase=true ;;
	*) patches_to_gen+=("$arg") ;;
	esac
done

# Read kernel version tag from PKGBUILD
mt76_kver=$(grep '^_mt76_kver=' "$DKMS_DIR/PKGBUILD" | cut -d"'" -f2)
tarball="$DKMS_DIR/linux-${mt76_kver}.tar.xz"

# The dkms branch must be based on dkms-base (v6.19.x + mt7902 patch).
# This ensures diffs have the correct context for DKMS builds.
base_ref="dkms-base"

if ! git -C "$KERNEL_TREE" rev-parse --verify "$base_ref" &>/dev/null; then
	echo "ERROR: $base_ref ref not found in $KERNEL_TREE"
	echo "Create it: git checkout -b dkms-base v\${mt76_kver} && apply mt7902 patch"
	exit 1
fi

# ── Rebase DKMS branch from upstream ────────────────────────────────
if $do_rebase; then
	if [[ -z "$UPSTREAM_BRANCH" ]]; then
		echo "ERROR: no mt7927-wifi-support-v* branch found in $KERNEL_TREE"
		exit 1
	fi
	if ! git -C "$KERNEL_TREE" rev-parse --verify "$UPSTREAM_BRANCH" &>/dev/null; then
		echo "ERROR: upstream branch $UPSTREAM_BRANCH not found"
		exit 1
	fi

	echo "==> Using upstream branch: $UPSTREAM_BRANCH"

	# Count upstream commits (only mt76 changes above the merge base)
	upstream_base=$(git -C "$KERNEL_TREE" log --format='%H' \
		"$UPSTREAM_BRANCH" -- "$MT76_SUBDIR/" | tail -1)
	upstream_tip=$(git -C "$KERNEL_TREE" rev-parse "$UPSTREAM_BRANCH")
	commit_count=$(git -C "$KERNEL_TREE" rev-list --count \
		"${upstream_base}..${upstream_tip}" -- "$MT76_SUBDIR/")

	# Get upstream commit range (mt76 commits only)
	mapfile -t upstream_commits < <(
		git -C "$KERNEL_TREE" log --reverse --format='%H' \
			"${UPSTREAM_BRANCH}~${commit_count}..${UPSTREAM_BRANCH}"
	)

	echo "==> Rebasing $KERNEL_BRANCH onto $base_ref with ${#upstream_commits[@]} commits from $UPSTREAM_BRANCH..."

	# Save current branch and create backup
	prev_branch=$(git -C "$KERNEL_TREE" symbolic-ref --short HEAD 2>/dev/null || echo "")
	if git -C "$KERNEL_TREE" rev-parse --verify "$KERNEL_BRANCH" &>/dev/null; then
		git -C "$KERNEL_TREE" branch -f "${KERNEL_BRANCH}-backup" "$KERNEL_BRANCH"
	fi

	# Cleanup trap: abort cherry-pick and restore branch on failure
	_rebase_cleanup() {
		git -C "$KERNEL_TREE" cherry-pick --abort 2>/dev/null || true
		if [[ -n "$prev_branch" ]]; then
			git -C "$KERNEL_TREE" checkout "$prev_branch" 2>/dev/null || true
		fi
	}

	# Reset DKMS branch to base
	git -C "$KERNEL_TREE" branch -f "$KERNEL_BRANCH" "$base_ref"
	git -C "$KERNEL_TREE" checkout "$KERNEL_BRANCH"

	# Cherry-pick all upstream commits
	if ! git -C "$KERNEL_TREE" cherry-pick "${upstream_commits[@]}" 2>&1; then
		echo ""
		echo "Cherry-pick conflict detected. Resolve manually:"
		echo "  cd $KERNEL_TREE"
		echo "  # resolve conflicts"
		echo "  git cherry-pick --continue"
		echo "  # then re-run: ./gen-dkms-patches.sh"
		echo ""
		echo "To restore previous state: git checkout $prev_branch && git branch -f $KERNEL_BRANCH ${KERNEL_BRANCH}-backup"
		_rebase_cleanup
		exit 1
	fi

	echo "==> Rebase complete: $(git -C "$KERNEL_TREE" log --oneline "$KERNEL_BRANCH" --not "$base_ref" | wc -l) commits"

	# Restore previous branch
	if [[ -n "$prev_branch" ]]; then
		git -C "$KERNEL_TREE" checkout "$prev_branch"
	fi

	# Clean backup on success
	git -C "$KERNEL_TREE" branch -D "${KERNEL_BRANCH}-backup" 2>/dev/null || true
fi

if [[ ! -f "$tarball" ]]; then
	echo "ERROR: Tarball $tarball not found"
	echo "Download it or run makepkg --nobuild to fetch sources first."
	exit 1
fi

# Get ordered commit list from kernel branch (above dkms-base)
mapfile -t commits < <(
	git -C "$KERNEL_TREE" log --reverse --format='%H' \
		"$KERNEL_BRANCH" --not "$base_ref"
)

if ((${#commits[@]} == 0)); then
	echo "No commits found on $KERNEL_BRANCH above $base_ref"
	exit 1
fi

echo "Found ${#commits[@]} commits on $KERNEL_BRANCH (base: $base_ref)"

# Build subject-to-filename mapping from existing patches
declare -A subject_to_file
for patchfile in "$DKMS_DIR"/mt7927-wifi-*.patch; do
	[[ -f "$patchfile" ]] || continue
	subject=$(head -1 "$patchfile")
	subject_to_file["$subject"]="$(basename "$patchfile")"
done

# Create temp workspace with git-tracked mt76 source
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

echo "Extracting mt76 from kernel v${mt76_kver}..."
mkdir -p "$work/mt76"
tar -xf "$tarball" --strip-components=6 -C "$work/mt76" \
	"linux-${mt76_kver}/${MT76_SUBDIR}"

cd "$work/mt76"
git init -q
git config user.email "$(git -C "$KERNEL_TREE" config user.email)"
git config user.name "$(git -C "$KERNEL_TREE" config user.name)"
git add -A
git commit -q -m "kernel.org v${mt76_kver}"

# Apply mt7902 patch to establish shifted baseline
patch -p1 --quiet <"$DKMS_DIR/mt7902-wifi-6.19.patch"
git add -A
git commit -q -m "mt7902"

# Clean stale patches before full regeneration
if ((${#patches_to_gen[@]} == 0)) && ! $dry_run; then
	echo "Cleaning old DKMS patches..."
	rm -f "$DKMS_DIR"/mt7927-wifi-*.patch
fi

echo "Generating patches..."

errors=0

for i in "${!commits[@]}"; do
	n=$((i + 1))
	nn=$(printf '%02d' "$n")
	commit=${commits[$i]}

	# Get commit info from kernel tree
	subject=$(git -C "$KERNEL_TREE" log -1 --format='%s' "$commit")
	body=$(git -C "$KERNEL_TREE" log -1 --format='%B' "$commit")

	# Extract diff from kernel tree, strip mt76 path prefix
	kernel_diff=$(git -C "$KERNEL_TREE" diff -U1 "${commit}^..$commit" \
		-- "$MT76_SUBDIR/" |
		sed "s|a/${MT76_SUBDIR}/|a/|g; s|b/${MT76_SUBDIR}/|b/|g")

	if [[ -z "$kernel_diff" ]]; then
		echo "  WARNING: [$nn] ($subject) empty diff - skipping"
		continue
	fi

	# Apply to temp tree (which has mt7902 + preceding patches)
	cd "$work/mt76"
	if ! echo "$kernel_diff" | git apply --quiet 2>/dev/null; then
		if ! echo "$kernel_diff" | git apply --3way --quiet 2>/dev/null; then
			echo "  FAIL: [$nn] $subject"
			errors=$((errors + 1))
			continue
		fi
	fi
	git add -A
	git commit -q -m "$subject"

	# Capture diff from the temp repo - these line numbers are exact
	dkms_diff=$(git diff -U1 HEAD~1..HEAD)

	# Find existing patch file or generate new name
	if [[ -n "${subject_to_file[$subject]:-}" ]]; then
		outfile="${subject_to_file[$subject]}"
	else
		slug=$(echo "$subject" |
			sed 's/wifi: mt76: mt7925: //' |
			tr '[:upper:]' '[:lower:]' |
			tr ' ' '-' |
			sed 's/[^a-z0-9-]//g' |
			cut -c1-40 |
			sed 's/-$//')
		outfile="mt7927-wifi-${nn}-${slug}.patch"
	fi

	# Filter to specific patches if requested
	if ((${#patches_to_gen[@]} > 0)); then
		skip=true
		for p in "${patches_to_gen[@]}"; do
			if ((p == n)); then
				skip=false
				break
			fi
		done
		$skip && continue
	fi

	if $dry_run; then
		echo "  [$nn/${#commits[@]}] $outfile (OK)"
		continue
	fi

	# Write patch: commit message + SHA + diff
	{
		echo -n "$body" | sed -e :a -e '/^\n*$/{$d;N;ba}'
		echo ""
		echo ""
		echo "$commit"
		echo "$dkms_diff"
	} >"$DKMS_DIR/$outfile"

	echo "  [$nn/${#commits[@]}] $outfile"
done

if ((errors > 0)); then
	echo "FAILED: $errors patch(es) could not be applied"
	exit 1
fi

echo "Done."
