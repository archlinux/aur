#!/usr/bin/env python
from yaml import safe_load as yaml_load
from json import dumps as json_dumps
from base64 import urlsafe_b64encode
from subprocess import check_output, check_call

# User settings
PCR_IDS = [0, 7]
PCR_BANK = "sha256"
# End of user settings

_PCR_BANK_SIZES = {
    "sha1": 20,
    "sha256": 32
}

def get_rootdev() -> str:
    with open('/proc/cmdline', 'r') as f:
        cmdline = f.read().strip()

    args = cmdline.split()
    for arg in args:
        if not arg.startswith("cryptdevice="):
            continue
        
        devinfo = arg.split('=')
        if devinfo[1] != 'UUID':
            raise ValueError("Only UUID is supported for cryptdevice")
        
        devspl = devinfo[2].split(':')
        return f"/dev/disk/by-uuid/{devspl[0]}"

def find_clevis_tpm2_bind(dev: str) -> int | None:
    try:
        output = check_output(["clevis", "luks", "list", "-d", dev])
    except:
        return None

    for line in output.splitlines():
        lspl = line.split()
        if lspl[1] != b'tpm2':
            continue
        return int(lspl[0].removesuffix(b':'), 10)
    return None

def calculate_boot_pcr_digest(pcr_bank: str, pcrs: list[int]) -> str:
    pcrs_yaml = yaml_load(check_output(["tpm2_eventlog", "/sys/kernel/security/tpm0/binary_bios_measurements"]))
    pcrs_list: dict[int, int] = pcrs_yaml['pcrs'][pcr_bank]
    if not pcrs_list:
        raise ValueError("No PCR values found in the event log")

    pcr_size = _PCR_BANK_SIZES[pcr_bank]

    data = b""
    for pcr in pcrs:
        data += int.to_bytes(pcrs_list[pcr], pcr_size, 'big')
    return urlsafe_b64encode(data).rstrip(b"=").decode('utf-8')

def main():
    rootdev = get_rootdev()
    pcr_digest = calculate_boot_pcr_digest(PCR_BANK, PCR_IDS)

    clevis_config = {
        "pcr_bank": PCR_BANK,
        "pcr_ids": ",".join(map(str, PCR_IDS)),
        "pcr_digest": pcr_digest,
    }
    clevis_config_str = json_dumps(clevis_config)
    clevis_config_str = clevis_config_str.replace(' ', '')

    tpm2_bind = find_clevis_tpm2_bind(rootdev)

    print(clevis_config_str, tpm2_bind)

    if tpm2_bind is None:
        print("No TPM2 binding found for the root device, creating a new one...")
        check_call(["clevis", "luks", "bind", "-d", rootdev, "tpm2", clevis_config_str])
    else:
        print(f"TPM2 binding found for the root device: {tpm2_bind}, updating it...")
        check_call(["clevis", "luks", "edit", "-d", rootdev, "-s", str(tpm2_bind), "-c", clevis_config_str])

if __name__ == '__main__':
    main()
