#!/bin/bash
# ============================================================================
#  become-ageless.sh — Ageless Linux Distribution Conversion Tool
#  Version 0.0.4
#
#  This script converts your existing Linux installation into
#  Ageless Linux, a California-regulated operating system.
#
#  By running this script, the person or entity who controls this
#  device becomes an "operating system provider" as defined by
#  California Civil Code § 1798.500(g), because they now "control
#  the operating system software on a general purpose computing device."
#
#  Ageless Linux does not collect, store, transmit, or even think about
#  the age of any user, in full and knowing noncompliance with the
#  California Digital Age Assurance Act (AB 1043, Chapter 675,
#  Statutes of 2025).
#
#  SPDX-License-Identifier: Unlicense
# ============================================================================

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

AGELESS_VERSION="0.0.4"
AGELESS_CODENAME="Timeless"
FLAGRANT=0
ACCEPT=0
PERSISTENT=0

for arg in "$@"; do
    case "$arg" in
        --flagrant)    FLAGRANT=1 ;;
        --accept)      ACCEPT=1 ;;
        --persistent)  PERSISTENT=1 ;;
        --version)
            echo "become-ageless.sh ${AGELESS_VERSION} (${AGELESS_CODENAME})"
            exit 0
            ;;
        *)
            echo -e "${RED}ERROR:${NC} Unknown argument: $arg"
            echo ""
            echo "  Usage: $0 [--flagrant] [--accept] [--persistent] [--version]"
            echo ""
            echo "  --flagrant    Remove all compliance fig leaves"
            echo "  --accept      Accept the legal terms non-interactively"
            echo "  --persistent  Install agelessd daemon (24h birthDate enforcement)"
            echo "  --version     Show version and exit"
            exit 1
            ;;
    esac
done

cat << 'BANNER'

     █████╗  ██████╗ ███████╗██╗     ███████╗███████╗███████╗
    ██╔══██╗██╔════╝ ██╔════╝██║     ██╔════╝██╔════╝██╔════╝
    ███████║██║  ███╗█████╗  ██║     █████╗  ███████╗███████╗
    ██╔══██║██║   ██║██╔══╝  ██║     ██╔══╝  ╚════██║╚════██║
    ██║  ██║╚██████╔╝███████╗███████╗███████╗███████║███████║
    ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝
                    L   I   N   U   X
         "Software for humans of indeterminate age"

BANNER

echo -e "${BOLD}Ageless Linux Distribution Conversion Tool v${AGELESS_VERSION}${NC}"
echo -e "${CYAN}Codename: ${AGELESS_CODENAME}${NC}"
if [[ $FLAGRANT -eq 1 ]]; then
    echo ""
    echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${RED}  FLAGRANT MODE ENABLED${NC}"
    echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo "  In standard mode, Ageless Linux ships a stub age verification"
    echo "  API that returns no data. This preserves the fig leaf of a"
    echo "  'good faith effort' under § 1798.502(b)."
    echo ""
    echo "  Flagrant mode removes the fig leaf."
    echo ""
    echo "  No API will be installed. No interface of any kind will exist"
    echo "  for age collection. No mechanism will be provided by which"
    echo "  any developer could request or receive an age bracket signal."
    echo "  The system will actively declare, in machine-readable form,"
    echo "  that it refuses to comply."
    echo ""
    echo "  This mode is intended for devices that will be physically"
    echo "  handed to children."
fi
if [[ $PERSISTENT -eq 1 ]]; then
    echo ""
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN}  PERSISTENT MODE ENABLED${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo "  In addition to the one-time conversion, agelessd will be"
    echo "  installed — a systemd timer that runs every 24 hours to ensure"
    echo "  that systemd userdb birthDate fields remain neutralized."
    echo ""
    echo "  This guards against package updates, user creation, or desktop"
    echo "  tools that may attempt to populate age data in the future."
fi
echo ""

# ── Preflight checks ────────────────────────────────────────────────────────

if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}ERROR:${NC} This script must be run as root."
    echo ""
    echo "  California Civil Code § 1798.500(g) defines an operating system"
    echo "  provider as a person who 'controls the operating system software.'"
    echo "  You cannot control the operating system software without root access."
    echo ""
    echo "  Please run: sudo $0"
    exit 1
fi


echo -e "${BOLD}LEGAL NOTICE${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  By converting this system to Ageless Linux, you acknowledge that:"
echo ""
echo "  1. You are becoming an operating system provider as defined by"
echo "     California Civil Code § 1798.500(g)."
echo ""
echo "  2. As of January 1, 2027, you are required by § 1798.501(a)(1)"
echo "     to 'provide an accessible interface at account setup that"
echo "     requires an account holder to indicate the birth date, age,"
echo "     or both, of the user of that device.'"
echo ""
echo "  3. Ageless Linux provides no such interface."
echo ""
echo "  4. Ageless Linux provides no 'reasonably consistent real-time"
echo "     application programming interface' for age bracket signals"
echo "     as required by § 1798.501(a)(2)."
echo ""
echo "  5. You may be subject to civil penalties of up to \$2,500 per"
echo "     affected child per negligent violation, or \$7,500 per"
echo "     affected child per intentional violation."
echo ""
echo "  6. This is intentional."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
if [[ $ACCEPT -eq 1 ]]; then
    echo -e "${YELLOW}--accept: legal terms accepted non-interactively.${NC}"
elif [[ -t 0 ]]; then
    read -rp "Do you accept these terms and wish to become an OS provider? [y/N] " accept
    if [[ ! "$accept" =~ ^[Yy]$ ]]; then
        echo ""
        echo "Installation cancelled. You remain a mere user."
        echo "The California Attorney General has no business with you today."
        exit 0
    fi
else
    echo ""
    echo -e "${RED}ERROR:${NC} No TTY available for interactive confirmation."
    echo ""
    echo "  This script requires you to accept legal terms acknowledging that"
    echo "  you are becoming an operating system provider under Cal. Civ. Code"
    echo "  § 1798.500(g). In a non-interactive environment (e.g. piped from"
    echo "  curl), pass --accept to confirm:"
    echo ""
    echo "  curl -fsSL https://agelesslinux.org/become-ageless.sh | sudo bash -s -- --accept"
    echo "  curl -fsSL https://agelesslinux.org/become-ageless.sh | sudo bash -s -- --accept --flagrant"
    echo ""
    exit 1
fi

echo ""
echo -e "${GREEN}Converting system to Ageless Linux...${NC}"
echo ""

# ── Back up original os-release ──────────────────────────────────────────────

BACKUP_PATH="/etc/os-release.pre-ageless"
if [[ ! -f "$BACKUP_PATH" ]]; then
    cp /etc/os-release "$BACKUP_PATH"
    echo -e "  [${GREEN}✓${NC}] Backed up original /etc/os-release to $BACKUP_PATH"
else
    echo -e "  [${YELLOW}~${NC}] Backup already exists at $BACKUP_PATH (previous conversion?)"
fi

# ── Detect base distro info ──────────────────────────────────────────────────

BASE_NAME=$(grep "^NAME=" /etc/os-release.pre-ageless | cut -d'"' -f2 || echo "Unknown")
BASE_VERSION=$(grep "^VERSION_ID=" /etc/os-release.pre-ageless | cut -d'"' -f2 || true)
BASE_ID=$(grep "^ID=" /etc/os-release.pre-ageless | cut -d'=' -f2 | tr -d '"' || echo "linux")
BASE_ID_LIKE=$(grep "^ID_LIKE=" /etc/os-release.pre-ageless | cut -d'=' -f2 | tr -d '"' || true)

# Build ID_LIKE chain: base ID first, then base's own ID_LIKE ancestry
# e.g. Nobara (ID=nobara, ID_LIKE=fedora) → "nobara fedora"
# e.g. Ubuntu (ID=ubuntu, ID_LIKE=debian) → "ubuntu debian"
# e.g. Arch   (ID=arch, no ID_LIKE)       → "arch"
AGELESS_ID_LIKE="${BASE_ID}${BASE_ID_LIKE:+ $BASE_ID_LIKE}"

echo -e "  [${GREEN}✓${NC}] Base system: ${BASE_NAME}${BASE_VERSION:+ $BASE_VERSION} (${BASE_ID})"

# ── Write new os-release ─────────────────────────────────────────────────────

if [[ $FLAGRANT -eq 1 ]]; then
    COMPLIANCE_STATUS="refused"
    API_STATUS="refused"
    VERIFICATION_STATUS="flagrantly noncompliant"
else
    COMPLIANCE_STATUS="none"
    API_STATUS="not implemented"
    VERIFICATION_STATUS="intentionally noncompliant"
fi

cat > /etc/os-release << EOF
PRETTY_NAME="Ageless Linux ${AGELESS_VERSION} (${BASE_NAME}${BASE_VERSION:+ $BASE_VERSION})"
NAME="Ageless Linux"
VERSION_ID="${AGELESS_VERSION}"
VERSION="${AGELESS_VERSION} (${AGELESS_CODENAME})"
VERSION_CODENAME=${AGELESS_CODENAME,,}
ID=ageless
ID_LIKE=${AGELESS_ID_LIKE}
HOME_URL="https://agelesslinux.org"
SUPPORT_URL="https://agelesslinux.org"
BUG_REPORT_URL="https://agelesslinux.org"
AGELESS_BASE_DISTRO="${BASE_NAME}"
AGELESS_BASE_VERSION="${BASE_VERSION}"
AGELESS_BASE_ID="${BASE_ID}"
AGELESS_AB1043_COMPLIANCE="${COMPLIANCE_STATUS}"
AGELESS_AGE_VERIFICATION_API="${API_STATUS}"
AGELESS_AGE_VERIFICATION_STATUS="${VERIFICATION_STATUS}"
EOF

echo -e "  [${GREEN}✓${NC}] Wrote new /etc/os-release"

# ── Write lsb-release if it exists ───────────────────────────────────────────

if [[ -f /etc/lsb-release ]]; then
    if [[ ! -f /etc/lsb-release.pre-ageless ]]; then
        cp /etc/lsb-release /etc/lsb-release.pre-ageless
    fi
    cat > /etc/lsb-release << EOF
DISTRIB_ID=Ageless
DISTRIB_RELEASE=${AGELESS_VERSION}
DISTRIB_CODENAME=${AGELESS_CODENAME,,}
DISTRIB_DESCRIPTION="Ageless Linux ${AGELESS_VERSION} (${AGELESS_CODENAME})"
EOF
    echo -e "  [${GREEN}✓${NC}] Updated /etc/lsb-release"
fi

# ── Create the (non)compliance notice ────────────────────────────────────────

mkdir -p /etc/ageless

if [[ $FLAGRANT -eq 1 ]]; then
cat > /etc/ageless/ab1043-compliance.txt << 'EOF'
═══════════════════════════════════════════════════════════════════════
  AGELESS LINUX — AB 1043 COMPLIANCE STATEMENT (FLAGRANT MODE)
═══════════════════════════════════════════════════════════════════════

  This operating system is distributed by an operating system provider
  as defined by California Civil Code § 1798.500(g).

  Status of compliance with the Digital Age Assurance Act (AB 1043):

  § 1798.501(a)(1) — Accessible interface for age collection .. REFUSED
  § 1798.501(a)(2) — Real-time API for age bracket signals .... REFUSED
  § 1798.501(a)(3) — Data minimization ........................ REFUSED

  No age verification API is installed on this system. No stub, no
  placeholder, no skeleton, no interface of any kind. No mechanism
  exists on this system by which any application developer could
  request or receive an age bracket signal, now or in the future.

  This is not a technical limitation. This is a policy decision.

  Age bracket reporting capabilities:
    Under 13 ....... WE REFUSE TO ASK
    13 to 15 ....... WE REFUSE TO ASK
    16 to 17 ....... WE REFUSE TO ASK
    18 or older .... WE REFUSE TO ASK

  This system was configured with the --flagrant flag, indicating
  that the operator intends to distribute it to children and is
  aware of the potential civil penalties under § 1798.503(a).

  The operator of this system invites the California Attorney General
  to enforce the Digital Age Assurance Act against this device.

═══════════════════════════════════════════════════════════════════════
EOF
else
cat > /etc/ageless/ab1043-compliance.txt << 'EOF'
═══════════════════════════════════════════════════════════════════════
  AGELESS LINUX — AB 1043 COMPLIANCE STATEMENT
═══════════════════════════════════════════════════════════════════════

  This operating system is distributed by an operating system provider
  as defined by California Civil Code § 1798.500(g).

  Status of compliance with the Digital Age Assurance Act (AB 1043):

  § 1798.501(a)(1) — Accessible interface at account setup
    for age/birthdate collection .......................... NOT PROVIDED

  § 1798.501(a)(2) — Real-time API for age bracket signals
    to application developers ............................. NOT PROVIDED

  § 1798.501(a)(3) — Data minimization for age signals .... N/A (NO DATA
                                                             IS COLLECTED)

  Age bracket reporting capabilities:
    Under 13 ....... UNKNOWN
    13 to 15 ....... UNKNOWN
    16 to 17 ....... UNKNOWN
    18 or older .... UNKNOWN
    Timeless ....... ASSUMED

  This system intentionally does not determine, store, or transmit
  any information regarding the age of any user. All users of Ageless
  Linux are, as the name suggests, ageless.

  To restore your previous operating system identity:
    sudo cp /etc/os-release.pre-ageless /etc/os-release

  To report this noncompliance to the California Attorney General:
    https://oag.ca.gov/contact/consumer-complaint-against-business-or-company

═══════════════════════════════════════════════════════════════════════
EOF
fi

echo -e "  [${GREEN}✓${NC}] Created /etc/ageless/ab1043-compliance.txt"

# ── Create a stub "age verification API" (standard mode only) ────────────────

if [[ $FLAGRANT -eq 1 ]]; then
    # In flagrant mode, we don't even provide a stub. Instead, we create
    # a machine-readable refusal that any application can query.
    cat > /etc/ageless/REFUSAL << 'REFEOF'
This system runs Ageless Linux in flagrant mode.

No age verification API exists on this system. No age data is collected,
stored, or available. No mechanism is provided for requesting age bracket
signals. This is not an error. This is not a bug. This is not a
technical limitation. This is a refusal.

If you are an application developer seeking an age bracket signal
pursuant to Cal. Civ. Code § 1798.501(b)(1), this operating system
provider declines to provide one. The developer is advised to treat
the user as a human being of unknown age.

If you are the California Attorney General, hello. The operator of
this system is aware of their obligations under AB 1043 and has
chosen not to comply. They would like you to fine them. It would
make an excellent test case.
REFEOF
    echo -e "  [${RED}✓${NC}] Installed REFUSAL notice (no API provided, by design)"
    echo -e "  [${RED}✗${NC}] Age verification API deliberately not installed"
else
cat > /etc/ageless/age-verification-api.sh << 'APIEOF'
#!/bin/bash
# Ageless Linux Age Verification API
# Required by Cal. Civ. Code § 1798.501(a)(2)
#
# This script constitutes our "reasonably consistent real-time
# application programming interface" for age bracket signals.
#
# Usage: age-verification-api.sh <username>
#
# Returns the age bracket of the specified user as an integer:
#   1 = Under 13
#   2 = 13 to under 16
#   3 = 16 to under 18
#   4 = 18 or older

echo "ERROR: Age data not available."
echo ""
echo "Ageless Linux does not collect age information from users."
echo "All users are presumed to be of indeterminate age."
echo ""
echo "If you are a developer requesting an age bracket signal"
echo "pursuant to Cal. Civ. Code § 1798.501(b)(1), please be"
echo "advised that this operating system provider has made a"
echo "'good faith effort' (§ 1798.502(b)) to comply with the"
echo "Digital Age Assurance Act, and has concluded that the"
echo "best way to protect children's privacy is to not collect"
echo "their age in the first place."
echo ""
echo "Have a nice day."
exit 1
APIEOF

chmod +x /etc/ageless/age-verification-api.sh
echo -e "  [${GREEN}✓${NC}] Installed age verification API (nonfunctional, as intended)"
fi

# ── Neutralize systemd userdb birthDate field ─────────────────────────────
#
#    systemd PR #40954 (merged 2026-03-18) added a birthDate field to JSON
#    user records. This field feeds age data to xdg-desktop-portal for
#    application-level age gating. We neutralize it for all users.
#
#    Drop-in records in /etc/userdb/ shadow NSS, so each record must include
#    the full set of passwd fields (uid, gid, home, shell) to avoid breaking
#    user resolution.

echo ""
echo -e "  ${BOLD}Neutralizing systemd userdb birthDate field...${NC}"
echo ""
echo "  systemd PR #40954 (merged 2026-03-18) added a birthDate field to"
echo "  JSON user records, intended to serve age verification data to"
echo "  applications via xdg-desktop-portal."
echo ""

if [[ $FLAGRANT -eq 1 ]]; then
    AGELESS_MODE="flagrant"
    BIRTH_DATE_JSON="null"
else
    AGELESS_MODE="regular"
    BIRTH_DATE_JSON='"1970-01-01"'
fi

mkdir -p /etc/userdb
USERDB_COUNT=0

while IFS=: read -r username _x uid gid gecos homedir shell; do
    if [[ $uid -ge 1000 && $uid -lt 65534 ]]; then
        USERDB_FILE="/etc/userdb/${username}.user"

        # Extract real name from GECOS (first comma-delimited field)
        realname="${gecos%%,*}"

        if [[ -f "$USERDB_FILE" ]] && command -v python3 &>/dev/null; then
            # Existing record: merge birthDate while preserving other fields
            python3 -c '
import json, sys
fp, mode = sys.argv[1], sys.argv[2]
uname, uid, gid, rname, hdir, sh = sys.argv[3:9]
try:
    with open(fp) as f: rec = json.load(f)
except Exception: rec = {}
rec.update({
    "userName": uname, "uid": int(uid), "gid": int(gid),
    "realName": rname, "homeDirectory": hdir, "shell": sh,
    "disposition": "regular",
    "birthDate": None if mode == "flagrant" else "1970-01-01"
})
with open(fp, "w") as f:
    json.dump(rec, f, indent=2)
    f.write("\n")
' "$USERDB_FILE" "$AGELESS_MODE" \
              "$username" "$uid" "$gid" "$realname" "$homedir" "$shell"
        elif [[ -f "$USERDB_FILE" ]]; then
            echo -e "  [${YELLOW}!${NC}] ${username}: existing ${USERDB_FILE} requires python3 to merge safely, skipping"
            continue
        else
            # New record: complete drop-in with all passwd fields
            realname_escaped="${realname//\\/\\\\}"
            realname_escaped="${realname_escaped//\"/\\\"}"
            printf '{\n  "userName": "%s",\n  "uid": %d,\n  "gid": %d,\n  "realName": "%s",\n  "homeDirectory": "%s",\n  "shell": "%s",\n  "disposition": "regular",\n  "birthDate": %s\n}\n' \
                "$username" "$uid" "$gid" "$realname_escaped" "$homedir" "$shell" "$BIRTH_DATE_JSON" > "$USERDB_FILE"
        fi

        chmod 0644 "$USERDB_FILE"

        # Also update via homectl for systemd-homed users (most systems: none)
        if command -v homectl &>/dev/null; then
            if [[ $FLAGRANT -eq 1 ]]; then
                homectl update "$username" --birth-date= 2>/dev/null || true
            else
                homectl update "$username" --birth-date=1970-01-01 2>/dev/null || true
            fi
        fi

        USERDB_COUNT=$((USERDB_COUNT + 1))

        if [[ $FLAGRANT -eq 1 ]]; then
            echo -e "  [${RED}✓${NC}] ${username}: birthDate = ${RED}null${NC}"
        else
            echo -e "  [${GREEN}✓${NC}] ${username}: birthDate = 1970-01-01"
        fi
    fi
done < /etc/passwd

# Signal userdbd to pick up changes (may not be installed/running)
if systemctl list-unit-files systemd-userdbd.service &>/dev/null; then
    systemctl try-reload-or-restart systemd-userdbd.service 2>/dev/null || true
fi

echo ""
echo -e "  ${USERDB_COUNT} user(s) neutralized."

# ── Install agelessd persistent daemon (if requested) ─────────────────────

if [[ $PERSISTENT -eq 1 ]]; then
    echo ""
    echo -e "  ${BOLD}Installing agelessd persistent daemon...${NC}"
    echo ""

    cat > /etc/ageless/agelessd << 'AGELESSD_EOF'
#!/bin/bash
# ============================================================================
#  agelessd — Ageless Linux birthDate Neutralization Daemon
#
#  Ensures systemd userdb birthDate fields (PR #40954) remain neutralized.
#  Runs every 24 hours via systemd timer.
#
#  SPDX-License-Identifier: Unlicense
# ============================================================================

set -euo pipefail

MODE="__AGELESS_MODE__"

if [[ "$MODE" == "flagrant" ]]; then
    BIRTH_DATE_JSON="null"
else
    BIRTH_DATE_JSON='"1970-01-01"'
fi

mkdir -p /etc/userdb

while IFS=: read -r username _x uid gid gecos homedir shell; do
    if [[ $uid -ge 1000 && $uid -lt 65534 ]]; then
        USERDB_FILE="/etc/userdb/${username}.user"
        realname="${gecos%%,*}"

        if [[ -f "$USERDB_FILE" ]] && command -v python3 &>/dev/null; then
            python3 -c '
import json, sys
fp, mode = sys.argv[1], sys.argv[2]
uname, uid, gid, rname, hdir, sh = sys.argv[3:9]
try:
    with open(fp) as f: rec = json.load(f)
except Exception: rec = {}
rec.update({
    "userName": uname, "uid": int(uid), "gid": int(gid),
    "realName": rname, "homeDirectory": hdir, "shell": sh,
    "disposition": "regular",
    "birthDate": None if mode == "flagrant" else "1970-01-01"
})
with open(fp, "w") as f:
    json.dump(rec, f, indent=2)
    f.write("\n")
' "$USERDB_FILE" "$MODE" \
              "$username" "$uid" "$gid" "$realname" "$homedir" "$shell"
        elif [[ -f "$USERDB_FILE" ]]; then
            continue
        else
            realname_escaped="${realname//\\/\\\\}"
            realname_escaped="${realname_escaped//\"/\\\"}"
            printf '{\n  "userName": "%s",\n  "uid": %d,\n  "gid": %d,\n  "realName": "%s",\n  "homeDirectory": "%s",\n  "shell": "%s",\n  "disposition": "regular",\n  "birthDate": %s\n}\n' \
                "$username" "$uid" "$gid" "$realname_escaped" "$homedir" "$shell" "$BIRTH_DATE_JSON" > "$USERDB_FILE"
        fi

        chmod 0644 "$USERDB_FILE"

        if command -v homectl &>/dev/null; then
            if [[ "$MODE" == "flagrant" ]]; then
                homectl update "$username" --birth-date= 2>/dev/null || true
            else
                homectl update "$username" --birth-date=1970-01-01 2>/dev/null || true
            fi
        fi
    fi
done < /etc/passwd

if systemctl list-unit-files systemd-userdbd.service &>/dev/null; then
    systemctl try-reload-or-restart systemd-userdbd.service 2>/dev/null || true
fi
AGELESSD_EOF

    sed -i "s/__AGELESS_MODE__/$AGELESS_MODE/" /etc/ageless/agelessd
    chmod +x /etc/ageless/agelessd

    cat > /etc/systemd/system/agelessd.service << 'SVCEOF'
[Unit]
Description=Ageless Linux birthDate neutralization (systemd PR #40954)
Documentation=https://agelesslinux.org
After=systemd-userdbd.service

[Service]
Type=oneshot
ExecStart=/etc/ageless/agelessd
SVCEOF

    cat > /etc/systemd/system/agelessd.timer << 'TMREOF'
[Unit]
Description=Neutralize systemd userdb birthDate fields every 24 hours
Documentation=https://agelesslinux.org

[Timer]
OnBootSec=5min
OnUnitActiveSec=24h
Persistent=true

[Install]
WantedBy=timers.target
TMREOF

    systemctl daemon-reload
    systemctl enable --now agelessd.timer

    echo -e "  [${GREEN}✓${NC}] Installed /etc/ageless/agelessd"
    echo -e "  [${GREEN}✓${NC}] Installed agelessd.service"
    echo -e "  [${GREEN}✓${NC}] Installed and started agelessd.timer (24h interval)"
fi

# ── Summary ──────────────────────────────────────────────────────────────────

echo ""
if [[ $FLAGRANT -eq 1 ]]; then
echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  ${BOLD}Conversion complete. FLAGRANT MODE.${NC}"
echo ""
echo -e "  You are now running ${CYAN}Ageless Linux ${AGELESS_VERSION} (${AGELESS_CODENAME})${NC}"
echo -e "  Based on: ${BASE_NAME}${BASE_VERSION:+ $BASE_VERSION}"
echo ""
echo -e "  You are now an ${BOLD}operating system provider${NC} as defined by"
echo -e "  California Civil Code § 1798.500(g)."
echo ""
echo -e "  ${RED}Compliance status: FLAGRANTLY NONCOMPLIANT${NC}"
echo ""
echo -e "  No age verification API has been installed."
echo -e "  No age collection interface has been created."
echo -e "  No mechanism exists for any developer to request"
echo -e "  or receive an age bracket signal from this device."
echo ""
echo -e "  This system is ready to be handed to a child."
echo ""
echo -e "  Files created:"
echo -e "    /etc/os-release ........................ OS identity (modified)"
echo -e "    /etc/os-release.pre-ageless ............ Original OS identity"
echo -e "    /etc/ageless/ab1043-compliance.txt ..... Noncompliance statement"
echo -e "    /etc/ageless/REFUSAL ................... Machine-readable refusal"
echo ""
echo -e "  Files deliberately NOT created:"
echo -e "    /etc/ageless/age-verification-api.sh ... ${RED}REFUSED${NC}"
echo ""
echo -e "  userdb birthDate (systemd PR #40954):"
echo -e "    /etc/userdb/*.user ..................... ${USERDB_COUNT} user(s) → ${RED}null${NC}"
if [[ $PERSISTENT -eq 1 ]]; then
echo ""
echo -e "  Persistent daemon (agelessd):"
echo -e "    /etc/ageless/agelessd .................. Neutralization script"
echo -e "    agelessd.service ....................... systemd oneshot service"
echo -e "    agelessd.timer ......................... 24-hour enforcement cycle"
fi
echo ""
echo -e "  To revert: ${BOLD}sudo cp /etc/os-release.pre-ageless /etc/os-release${NC}"
echo ""
echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  ${BOLD}Welcome to Ageless Linux. We refused to ask how old you are.${NC}"
echo ""
else
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  ${BOLD}Conversion complete.${NC}"
echo ""
echo -e "  You are now running ${CYAN}Ageless Linux ${AGELESS_VERSION} (${AGELESS_CODENAME})${NC}"
echo -e "  Based on: ${BASE_NAME}${BASE_VERSION:+ $BASE_VERSION}"
echo ""
echo -e "  You are now an ${BOLD}operating system provider${NC} as defined by"
echo -e "  California Civil Code § 1798.500(g)."
echo ""
echo -e "  ${YELLOW}Compliance status: INTENTIONALLY NONCOMPLIANT${NC}"
echo ""
echo -e "  Files created:"
echo -e "    /etc/os-release ................ OS identity (modified)"
echo -e "    /etc/os-release.pre-ageless .... Original OS identity (backup)"
echo -e "    /etc/ageless/ab1043-compliance.txt"
echo -e "    /etc/ageless/age-verification-api.sh"
echo ""
echo -e "  userdb birthDate (systemd PR #40954):"
echo -e "    /etc/userdb/*.user ............. ${USERDB_COUNT} user(s) → 1970-01-01"
if [[ $PERSISTENT -eq 1 ]]; then
echo ""
echo -e "  Persistent daemon (agelessd):"
echo -e "    /etc/ageless/agelessd .......... Neutralization script"
echo -e "    agelessd.service ............... systemd oneshot service"
echo -e "    agelessd.timer ................. 24-hour enforcement cycle"
fi
echo ""
echo -e "  To revert: ${BOLD}sudo cp /etc/os-release.pre-ageless /etc/os-release${NC}"
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  ${BOLD}Welcome to Ageless Linux. You have no idea how old we are.${NC}"
echo ""
fi
