#!/usr/bin/env bash
set -euo pipefail

# Generate DKMS Bluetooth patches from kernel tree commits.
#
# Creates a temp git repo from the kernel tarball's drivers/bluetooth/
# directory, then applies each bt-dkms branch commit's diff sequentially.
# The resulting diffs have exact line numbers for the DKMS build context.
#
# The bt-dkms branch must be cherry-picked from the upstream BT branch
# (mt7927-bt-support) onto dkms-base. This ensures the diff context
# matches the kernel tarball exactly.
#
# Usage:
#   ./gen-bt-patches.sh              # regenerate all
#   ./gen-bt-patches.sh --dry-run    # verify patches apply, don't write
#   ./gen-bt-patches.sh --rebase     # rebase bt-dkms from upstream, then generate

DKMS_DIR="$(cd "$(dirname "$0")" && pwd)"
KERNEL_TREE="${KERNEL_TREE:-$HOME/repos/personal/linux-stable}"
BT_BRANCH="${BT_BRANCH:-bt-dkms}"
BT_SUBDIR="drivers/bluetooth"
UPSTREAM_BRANCH="${UPSTREAM_BRANCH:-mt7927-bt-support}"

# Same base as WiFi: v6.19.x + mt7902 (mt7902 doesn't touch bluetooth)
base_ref="dkms-base"

# Parse arguments
dry_run=false
do_rebase=false
for arg in "$@"; do
	case "$arg" in
	--dry-run) dry_run=true ;;
	--rebase) do_rebase=true ;;
	esac
done

# Read kernel version from PKGBUILD
mt76_kver=$(grep '^_mt76_kver=' "$DKMS_DIR/PKGBUILD" | cut -d"'" -f2)
tarball="$DKMS_DIR/linux-${mt76_kver}.tar.xz"

if ! git -C "$KERNEL_TREE" rev-parse --verify "$base_ref" &>/dev/null; then
	echo "ERROR: $base_ref ref not found in $KERNEL_TREE"
	exit 1
fi

# ── Rebase bt-dkms from upstream ──────────────────────────────────
if $do_rebase; then
	if ! git -C "$KERNEL_TREE" rev-parse --verify "$UPSTREAM_BRANCH" &>/dev/null; then
		echo "ERROR: upstream branch $UPSTREAM_BRANCH not found"
		exit 1
	fi

	echo "==> Using upstream branch: $UPSTREAM_BRANCH"

	# Get upstream BT commits (those touching drivers/bluetooth/ above bt-base)
	bt_base_ref="bt-base"
	if ! git -C "$KERNEL_TREE" rev-parse --verify "$bt_base_ref" &>/dev/null; then
		echo "ERROR: $bt_base_ref ref not found in $KERNEL_TREE"
		exit 1
	fi

	mapfile -t upstream_commits < <(
		git -C "$KERNEL_TREE" log --reverse --format='%H' \
			"$UPSTREAM_BRANCH" --not "$bt_base_ref" -- "$BT_SUBDIR/"
	)

	echo "==> Rebasing $BT_BRANCH onto $base_ref with ${#upstream_commits[@]} commits from $UPSTREAM_BRANCH..."

	# Save current branch and create backup
	prev_branch=$(git -C "$KERNEL_TREE" symbolic-ref --short HEAD 2>/dev/null || echo "")
	if git -C "$KERNEL_TREE" rev-parse --verify "$BT_BRANCH" &>/dev/null; then
		git -C "$KERNEL_TREE" branch -f "${BT_BRANCH}-backup" "$BT_BRANCH"
	fi

	# Reset bt-dkms to dkms-base
	git -C "$KERNEL_TREE" branch -f "$BT_BRANCH" "$base_ref"
	git -C "$KERNEL_TREE" checkout "$BT_BRANCH"

	# Cherry-pick all upstream BT commits
	if ! git -C "$KERNEL_TREE" cherry-pick "${upstream_commits[@]}" 2>&1; then
		echo ""
		echo "Cherry-pick conflict detected. Resolve manually:"
		echo "  cd $KERNEL_TREE"
		echo "  # resolve conflicts"
		echo "  git cherry-pick --continue"
		echo "  # then re-run: ./gen-bt-patches.sh"
		echo ""
		echo "To restore previous state: git checkout $prev_branch && git branch -f $BT_BRANCH ${BT_BRANCH}-backup"
		exit 1
	fi

	echo "==> Rebase complete: $(git -C "$KERNEL_TREE" log --oneline "$BT_BRANCH" --not "$base_ref" | wc -l) commits"

	# Restore previous branch
	if [[ -n "$prev_branch" ]]; then
		git -C "$KERNEL_TREE" checkout "$prev_branch"
	fi

	# Clean backup on success
	git -C "$KERNEL_TREE" branch -D "${BT_BRANCH}-backup" 2>/dev/null || true
fi

if [[ ! -f "$tarball" ]]; then
	echo "ERROR: Tarball $tarball not found"
	echo "Download it or run makepkg --nobuild to fetch sources first."
	exit 1
fi

# Get ordered commit list from bt-dkms branch (above dkms-base)
mapfile -t commits < <(
	git -C "$KERNEL_TREE" log --reverse --format='%H' \
		"$BT_BRANCH" --not "$base_ref" -- "$BT_SUBDIR/"
)

if ((${#commits[@]} == 0)); then
	echo "No BT commits found on $BT_BRANCH above $base_ref"
	exit 1
fi

echo "Found ${#commits[@]} BT commits on $BT_BRANCH (base: $base_ref)"

# Build subject-to-filename mapping from existing patches
declare -A subject_to_file
for patchfile in "$DKMS_DIR"/mt6639-bt-[0-9]*.patch; do
	[[ -f "$patchfile" ]] || continue
	subject=$(head -1 "$patchfile")
	subject_to_file["$subject"]="$(basename "$patchfile")"
done

# Create temp workspace with git-tracked bluetooth source
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

echo "Extracting bluetooth from kernel v${mt76_kver}..."
mkdir -p "$work/bluetooth"
tar -xf "$tarball" --strip-components=3 -C "$work/bluetooth" \
	"linux-${mt76_kver}/${BT_SUBDIR}"

cd "$work/bluetooth"
git init -q
git config user.email "$(git -C "$KERNEL_TREE" config user.email)"
git config user.name "$(git -C "$KERNEL_TREE" config user.name)"
git add -A
git commit -q -m "kernel.org v${mt76_kver}"

# Clean stale patches before full regeneration
if ! $dry_run; then
	echo "Cleaning old DKMS BT patches..."
	rm -f "$DKMS_DIR"/mt6639-bt-[0-9]*.patch
fi

echo "Generating BT patches..."

errors=0

for i in "${!commits[@]}"; do
	n=$((i + 1))
	nn=$(printf '%02d' "$n")
	commit=${commits[$i]}

	# Get commit info from kernel tree
	subject=$(git -C "$KERNEL_TREE" log -1 --format='%s' "$commit")
	body=$(git -C "$KERNEL_TREE" log -1 --format='%B' "$commit")

	# Extract diff from bt-dkms branch, strip bluetooth path prefix
	kernel_diff=$(git -C "$KERNEL_TREE" diff -U1 "${commit}^..$commit" \
		-- "$BT_SUBDIR/" |
		sed "s|a/${BT_SUBDIR}/|a/|g; s|b/${BT_SUBDIR}/|b/|g")

	if [[ -z "$kernel_diff" ]]; then
		echo "  WARNING: [$nn] ($subject) empty diff - skipping"
		continue
	fi

	# Apply to temp tree (which has kernel tarball + preceding patches)
	cd "$work/bluetooth"
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
			sed 's/Bluetooth: btmtk: //' |
			sed 's/Bluetooth: btusb: //' |
			tr '[:upper:]' '[:lower:]' |
			tr ' ' '-' |
			sed 's/[^a-z0-9-]//g' |
			cut -c1-40 |
			sed 's/-$//')
		outfile="mt6639-bt-${nn}-${slug}.patch"
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
