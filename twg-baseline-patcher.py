#!/usr/bin/env python3

"""Replace the bundled Bun runtime with the matching x86_64 baseline runtime."""

from __future__ import annotations

import re
import struct
import sys
import zipfile
from pathlib import Path


ELFCLASS64 = 2
ELFDATA2LSB = 1
EM_X86_64 = 62
PT_LOAD = 1
PF_W = 2
SHT_NOBITS = 8
PAGE_SIZE = 0x1000

ELF_HEADER = struct.Struct("<16sHHIQQQIHHHHHH")
PROGRAM_HEADER = struct.Struct("<IIQQQQQQ")
SECTION_HEADER = struct.Struct("<IIQQQQIIQQ")
BUN_VERSION = re.compile(
    rb"Bun v([0-9]+\.[0-9]+\.[0-9]+) \(([^()\x00]+)\) Linux x64(?: \(baseline\))?"
)


class PatchError(Exception):
    """A source or ELF file does not match the expected Bun format."""


def align_up(value: int, alignment: int) -> int:
    return (value + alignment - 1) // alignment * alignment


def read_elf_header(data: bytes | bytearray) -> dict[str, int]:
    if len(data) < ELF_HEADER.size:
        raise PatchError("ELF header is truncated")

    values = ELF_HEADER.unpack_from(data)
    ident = values[0]
    if ident[:4] != b"\x7fELF":
        raise PatchError("file is not an ELF executable")
    if ident[4] != ELFCLASS64:
        raise PatchError("ELF file is not 64-bit")
    if ident[5] != ELFDATA2LSB:
        raise PatchError("ELF file is not little-endian")
    if values[2] != EM_X86_64:
        raise PatchError("ELF file is not x86_64")
    if values[9] != PROGRAM_HEADER.size or values[11] != SECTION_HEADER.size:
        raise PatchError("ELF header uses unsupported header sizes")

    header = {
        "phoff": values[5],
        "shoff": values[6],
        "phentsize": values[9],
        "phnum": values[10],
        "shentsize": values[11],
        "shnum": values[12],
        "shstrndx": values[13],
    }
    if header["phoff"] + header["phnum"] * header["phentsize"] > len(data):
        raise PatchError("ELF program header table is truncated")
    if header["shoff"] + header["shnum"] * header["shentsize"] > len(data):
        raise PatchError("ELF section header table is truncated")
    if header["shnum"] == 0 or header["shstrndx"] >= header["shnum"]:
        raise PatchError("ELF section-name table is invalid")
    return header


def read_program_header(
    data: bytes | bytearray, header: dict[str, int], index: int
) -> tuple[int, ...]:
    offset = header["phoff"] + index * header["phentsize"]
    return PROGRAM_HEADER.unpack_from(data, offset)


def write_program_header(
    data: bytearray, header: dict[str, int], index: int, values: tuple[int, ...]
) -> None:
    offset = header["phoff"] + index * header["phentsize"]
    PROGRAM_HEADER.pack_into(data, offset, *values)


def read_section_header(
    data: bytes | bytearray, header: dict[str, int], index: int
) -> tuple[int, ...]:
    offset = header["shoff"] + index * header["shentsize"]
    return SECTION_HEADER.unpack_from(data, offset)


def write_section_header(
    data: bytearray, header: dict[str, int], index: int, values: list[int]
) -> None:
    offset = header["shoff"] + index * header["shentsize"]
    SECTION_HEADER.pack_into(data, offset, *values)


def find_bun_section(
    data: bytes | bytearray, header: dict[str, int]
) -> tuple[int, tuple[int, ...]]:
    names_section = read_section_header(data, header, header["shstrndx"])
    names_offset = names_section[4]
    names_size = names_section[5]
    if names_offset + names_size > len(data):
        raise PatchError("ELF section-name table is truncated")
    names = data[names_offset : names_offset + names_size]

    for index in range(header["shnum"]):
        section = read_section_header(data, header, index)
        name_offset = section[0]
        if name_offset >= len(names):
            continue
        name_end = names.find(b"\0", name_offset)
        if name_end >= 0 and names[name_offset:name_end] == b".bun":
            return index, section
    raise PatchError("ELF .bun section is missing")


def extract_payload(data: bytes) -> bytes:
    header = read_elf_header(data)
    _, section = find_bun_section(data, header)
    offset = section[4]
    size = section[5]
    if offset + size > len(data) or size < 8:
        raise PatchError("ELF .bun section is truncated")

    payload_size = struct.unpack_from("<Q", data, offset)[0]
    if payload_size != size - 8:
        raise PatchError(
            f"ELF .bun payload size mismatch: {payload_size} != {size - 8}"
        )
    return data[offset + 8 : offset + size]


def runtime_signature(data: bytes, label: str) -> tuple[str, str]:
    matches = BUN_VERSION.findall(data)
    if not matches:
        raise PatchError(f"{label} does not contain a Bun x86_64 version marker")
    version, commit = matches[0]
    return version.decode("ascii"), commit.decode("ascii")


def extract_baseline_runtime(zip_path: Path) -> bytes:
    try:
        with zipfile.ZipFile(zip_path) as archive:
            candidates = [
                info
                for info in archive.infolist()
                if not info.is_dir() and info.filename.rsplit("/", 1)[-1] == "bun"
            ]
            if len(candidates) != 1:
                raise PatchError(
                    f"expected one Bun executable in {zip_path.name}, found {len(candidates)}"
                )
            return archive.read(candidates[0])
    except zipfile.BadZipFile as error:
        raise PatchError(f"{zip_path} is not a valid ZIP archive") from error


def patch_runtime(template: bytes, payload: bytes) -> bytes:
    data = bytearray(template)
    header = read_elf_header(data)
    bun_index, bun_section = find_bun_section(data, header)
    bun_file_offset = bun_section[4]
    bun_vaddr = bun_section[3]

    writable_index: int | None = None
    writable_segment: tuple[int, ...] | None = None
    max_vaddr_end = 0
    for index in range(header["phnum"]):
        program = read_program_header(data, header, index)
        p_type, p_flags, p_offset, p_vaddr, _, p_filesz, p_memsz, _ = program
        if p_type != PT_LOAD:
            continue
        max_vaddr_end = max(max_vaddr_end, p_vaddr + p_memsz)
        if (
            p_flags & PF_W
            and p_vaddr <= bun_vaddr
            and bun_vaddr < p_vaddr + p_memsz
        ):
            writable_index = index
            writable_segment = program

    if writable_index is None or writable_segment is None:
        raise PatchError("ELF writable load segment for .bun is missing")

    new_content_size = 8 + len(payload)
    aligned_new_size = align_up(new_content_size, PAGE_SIZE)
    new_vaddr = align_up(max_vaddr_end, PAGE_SIZE)
    _, _, segment_offset, segment_vaddr, _, segment_filesz, segment_memsz, _ = (
        writable_segment
    )
    offset_in_segment = new_vaddr - segment_vaddr
    new_file_offset = segment_offset + offset_in_segment

    if new_vaddr < segment_vaddr + segment_memsz:
        raise PatchError("new .bun virtual address overlaps an existing mapping")

    old_file_end = segment_offset + segment_filesz
    if old_file_end > len(data) or new_file_offset < old_file_end:
        raise PatchError("ELF writable segment has an invalid file layout")

    move_src_start = old_file_end
    move_src_end = len(data)
    moved_tail = bytes(data[move_src_start:move_src_end])
    move_dst_start = new_file_offset + aligned_new_size
    move_delta = move_dst_start - move_src_start

    old_section_table_offset = header["shoff"]
    section_table_size = header["shnum"] * header["shentsize"]
    if (
        old_section_table_offset < move_src_start
        or old_section_table_offset + section_table_size > move_src_end
    ):
        raise PatchError("ELF section header table is outside the relocatable tail")

    total_size = move_dst_start + len(moved_tail)
    data.extend(b"\0" * (total_size - len(data)))
    data[move_dst_start:total_size] = moved_tail
    data[move_src_start:new_file_offset] = b"\0" * (
        new_file_offset - move_src_start
    )
    struct.pack_into("<Q", data, new_file_offset, len(payload))
    data[new_file_offset + 8 : new_file_offset + new_content_size] = payload
    payload_end = new_file_offset + new_content_size
    if move_dst_start > payload_end:
        data[payload_end:move_dst_start] = b"\0" * (move_dst_start - payload_end)

    struct.pack_into("<Q", data, bun_file_offset, new_vaddr)

    new_section_table_offset = old_section_table_offset + move_delta
    struct.pack_into("<Q", data, 40, new_section_table_offset)
    header["shoff"] = new_section_table_offset

    for index in range(header["shnum"]):
        section = list(read_section_header(data, header, index))
        if index == bun_index:
            section[3] = new_vaddr
            section[4] = new_file_offset
            section[5] = new_content_size
        elif (
            section[1] != SHT_NOBITS
            and move_src_start <= section[4] < move_src_end
        ):
            section[4] += move_delta
        write_section_header(data, header, index, section)

    p_type, p_flags, p_offset, p_vaddr, p_paddr, _, _, p_align = writable_segment
    new_segment_size = offset_in_segment + aligned_new_size
    write_program_header(
        data,
        header,
        writable_index,
        (
            p_type,
            p_flags,
            p_offset,
            p_vaddr,
            p_paddr,
            new_segment_size,
            new_segment_size,
            p_align,
        ),
    )
    return bytes(data)


def main(argv: list[str]) -> int:
    if len(argv) != 4:
        print(
            f"Usage: {Path(argv[0]).name} SOURCE BUN_BASELINE_ZIP OUTPUT",
            file=sys.stderr,
        )
        return 2

    source_path, baseline_zip_path, output_path = map(Path, argv[1:])
    try:
        source = source_path.read_bytes()
        baseline = extract_baseline_runtime(baseline_zip_path)
        source_signature = runtime_signature(source, source_path.name)
        baseline_signature = runtime_signature(baseline, baseline_zip_path.name)
        if source_signature != baseline_signature:
            raise PatchError(
                "TWG and Bun baseline runtimes differ: "
                f"{source_signature} != {baseline_signature}"
            )

        patched = patch_runtime(baseline, extract_payload(source))
        output_path.write_bytes(patched)
        output_path.chmod(0o755)
    except PatchError as error:
        print(f"TWG baseline patch failed: {error}", file=sys.stderr)
        return 1
    except (OSError, zipfile.BadZipFile) as error:
        print(f"TWG baseline patch failed: {error}", file=sys.stderr)
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
