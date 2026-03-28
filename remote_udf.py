from __future__ import annotations

import re
import struct
import threading
import time
import urllib.error
import urllib.request
from dataclasses import dataclass
from time import perf_counter


SECTOR_SIZE = 2048
HTTP_TIMEOUT = 60
HTTP_RETRIES = 5


class ProbeError(RuntimeError):
    pass


class TimingStats:
    def __init__(self, enabled: bool = False) -> None:
        self.enabled = enabled
        self.http_requests = 0
        self.http_bytes = 0
        self.http_seconds = 0.0
        self._lock = threading.Lock()

    def record_http(self, elapsed: float, size: int) -> None:
        if not self.enabled:
            return
        with self._lock:
            self.http_requests += 1
            self.http_bytes += size
            self.http_seconds += elapsed

    def render(self, total_seconds: float | None = None) -> str:
        if not self.enabled:
            return ""

        lines = ["Timing summary:"]
        with self._lock:
            http_requests = self.http_requests
            http_bytes = self.http_bytes
            http_seconds = self.http_seconds

        if total_seconds is not None:
            lines.append(f"  total: {total_seconds:.3f}s")
        if http_requests:
            mib = http_bytes / (1024 * 1024)
            lines.append(
                f"  http.request: count={http_requests} total={http_seconds:.3f}s bytes={mib:.2f} MiB"
            )
        return "\n".join(lines)


@dataclass(frozen=True)
class UdfLongAd:
    length: int
    logical_block_num: int
    partition_ref: int


@dataclass(frozen=True)
class UdfExtent:
    file_offset: int
    physical_offset: int
    length: int


@dataclass(frozen=True)
class UdfContext:
    block_size: int
    partition_starts_by_ref: tuple[int, ...]
    root_icb: UdfLongAd


@dataclass(frozen=True)
class UdfFileEntry:
    info_length: int
    extents: tuple[UdfExtent, ...]


@dataclass(frozen=True)
class UdfFileIdentifier:
    name: str
    file_characteristics: int
    icb: UdfLongAd

    @property
    def is_parent(self) -> bool:
        return bool(self.file_characteristics & 0x08)


class HttpRangeReader:
    def __init__(
        self,
        url: str,
        user_agent: str = "Mozilla/5.0",
        timing: TimingStats | None = None,
    ) -> None:
        self.url = url
        self.user_agent = user_agent
        self.size: int | None = None
        self.timing = timing or TimingStats(enabled=False)

    def _request(self, start: int, end: int) -> bytes:
        request = urllib.request.Request(
            self.url,
            headers={
                "Range": f"bytes={start}-{end}",
                "User-Agent": self.user_agent,
                "Accept-Encoding": "identity",
                "Connection": "close",
            },
        )

        for attempt in range(1, HTTP_RETRIES + 1):
            try:
                request_start = perf_counter()
                with urllib.request.urlopen(request, timeout=HTTP_TIMEOUT) as response:
                    status = getattr(response, "status", None)
                    if status != 206:
                        raise ProbeError(
                            f"server did not honor range request: HTTP {status}"
                        )
                    content_range = response.headers.get("Content-Range")
                    if self.size is None and content_range:
                        match = re.match(r"bytes \d+-\d+/(\d+)", content_range)
                        if match:
                            self.size = int(match.group(1))
                    data = response.read()
                self.timing.record_http(perf_counter() - request_start, len(data))
                break
            except (TimeoutError, urllib.error.URLError, OSError) as exc:
                if attempt == HTTP_RETRIES:
                    raise ProbeError(
                        f"range request failed after {HTTP_RETRIES} attempts: {exc}"
                    ) from exc
                time.sleep(min(2 * attempt, 10))

        expected = end - start + 1
        if len(data) != expected:
            raise ProbeError(f"short read: expected {expected} bytes, got {len(data)}")
        return data

    def probe(self) -> int:
        if self.size is None:
            self._request(0, 0)
        if self.size is None:
            raise ProbeError("could not determine remote file size")
        return self.size

    def read_at(self, offset: int, size: int) -> bytes:
        if size < 0:
            raise ValueError("size must be non-negative")
        if size == 0:
            return b""
        total = self.probe()
        if offset < 0 or offset + size > total:
            raise ProbeError(
                f"range {offset}:{offset + size} is outside remote size {total}"
            )
        return self._request(offset, offset + size - 1)


class ExtentMappedReader:
    def __init__(
        self, base: HttpRangeReader, extents: tuple[UdfExtent, ...], size: int
    ) -> None:
        self.base = base
        self.extents = extents
        self.size = size

    def read_at(self, offset: int, size: int) -> bytes:
        if offset < 0 or size < 0 or offset + size > self.size:
            raise ProbeError(
                f"range {offset}:{offset + size} is outside mapped size {self.size}"
            )
        if size == 0:
            return b""

        cursor = offset
        remaining = size
        extent_index = 0
        chunks: list[bytes] = []
        while remaining:
            while extent_index < len(self.extents):
                extent = self.extents[extent_index]
                if cursor < extent.file_offset + extent.length:
                    break
                extent_index += 1
            else:
                extent = None

            if extent is None or cursor < extent.file_offset:
                raise ProbeError(f"file hole at offset {cursor}")
            within_extent = cursor - extent.file_offset
            take = min(remaining, extent.length - within_extent)
            chunks.append(
                self.base.read_at(extent.physical_offset + within_extent, take)
            )
            cursor += take
            remaining -= take
        return b"".join(chunks)


def align_up(value: int, alignment: int) -> int:
    return (value + alignment - 1) // alignment * alignment


def split_path(path: str) -> list[str]:
    return [part for part in path.replace("\\", "/").split("/") if part]


def find_named_child(
    items: list[object], part: str, *, skip_parent: bool = False
) -> object | None:
    wanted = part.casefold()
    for item in items:
        if skip_parent and getattr(item, "is_parent", False):
            continue
        if getattr(item, "name").casefold() == wanted:
            return item
    return None


def sample_names(
    items: list[object], *, skip_parent: bool = False, limit: int = 20
) -> str:
    names: list[str] = []
    for item in items:
        if skip_parent and getattr(item, "is_parent", False):
            continue
        names.append(getattr(item, "name"))
    return ", ".join(sorted(names)[:limit])


def tag_id(data: bytes, offset: int = 0) -> int:
    return struct.unpack_from("<H", data, offset)[0]


def parse_long_ad(data: bytes, offset: int) -> UdfLongAd:
    extent_length = struct.unpack_from("<I", data, offset)[0] & 0x3FFFFFFF
    logical_block_num = struct.unpack_from("<I", data, offset + 4)[0]
    partition_ref = struct.unpack_from("<H", data, offset + 8)[0]
    return UdfLongAd(extent_length, logical_block_num, partition_ref)


def block_offset(ctx: UdfContext, logical_block_num: int, partition_ref: int) -> int:
    try:
        start_block = ctx.partition_starts_by_ref[partition_ref]
    except IndexError as exc:
        raise ProbeError(f"unsupported partition reference {partition_ref}") from exc
    return (start_block + logical_block_num) * ctx.block_size


def has_udf(reader: HttpRangeReader) -> bool:
    seen_bea = False
    for sector in range(16, 32):
        data = reader.read_at(sector * SECTOR_SIZE, SECTOR_SIZE)
        ident = data[1:6]
        if ident == b"BEA01":
            seen_bea = True
        if seen_bea and ident in {b"NSR02", b"NSR03"}:
            return True
        if ident == b"TEA01":
            break
    return False


def read_udf_context(reader: HttpRangeReader) -> UdfContext:
    if not has_udf(reader):
        raise ProbeError("UDF volume recognition sequence not found")

    avdp = reader.read_at(256 * SECTOR_SIZE, SECTOR_SIZE)
    if tag_id(avdp) != 0x0002:
        raise ProbeError("anchor volume descriptor pointer not found at sector 256")

    mvds_length = struct.unpack_from("<I", avdp, 0x10)[0]
    mvds_location = struct.unpack_from("<I", avdp, 0x14)[0]
    mvds = reader.read_at(mvds_location * SECTOR_SIZE, mvds_length)

    logical_volume_descriptor = None
    partitions: dict[int, int] = {}
    for offset in range(0, len(mvds), SECTOR_SIZE):
        descriptor = mvds[offset : offset + SECTOR_SIZE]
        descriptor_id = tag_id(descriptor)
        if descriptor_id == 0x0006 and logical_volume_descriptor is None:
            logical_volume_descriptor = descriptor
        elif descriptor_id == 0x0005:
            partition_number = struct.unpack_from("<H", descriptor, 0x16)[0]
            partitions[partition_number] = struct.unpack_from("<I", descriptor, 0xBC)[0]
        elif descriptor_id == 0x0008:
            break

    if logical_volume_descriptor is None:
        raise ProbeError("logical volume descriptor not found")

    block_size = struct.unpack_from("<I", logical_volume_descriptor, 0xD4)[0]
    if block_size != SECTOR_SIZE:
        raise ProbeError(f"unsupported UDF logical block size {block_size}")

    fsd_icb = parse_long_ad(logical_volume_descriptor, 0xF8)
    map_table_length = struct.unpack_from("<I", logical_volume_descriptor, 0x108)[0]
    partition_map_count = struct.unpack_from("<I", logical_volume_descriptor, 0x10C)[0]
    map_data = logical_volume_descriptor[0x1B8 : 0x1B8 + map_table_length]

    partition_starts: list[int] = []
    cursor = 0
    for _ in range(partition_map_count):
        map_type = map_data[cursor]
        map_length = map_data[cursor + 1]
        if map_type != 1 or map_length != 6:
            raise ProbeError("only UDF type-1 partition maps are supported")
        partition_number = struct.unpack_from("<H", map_data, cursor + 4)[0]
        try:
            partition_starts.append(partitions[partition_number])
        except KeyError as exc:
            raise ProbeError(
                f"partition descriptor missing for partition {partition_number}"
            ) from exc
        cursor += map_length

    temp_ctx = UdfContext(
        block_size=block_size,
        partition_starts_by_ref=tuple(partition_starts),
        root_icb=UdfLongAd(0, 0, 0),
    )
    file_set_descriptor = reader.read_at(
        block_offset(temp_ctx, fsd_icb.logical_block_num, fsd_icb.partition_ref),
        block_size,
    )
    if tag_id(file_set_descriptor) != 0x0100:
        raise ProbeError("file set descriptor not found")

    return UdfContext(
        block_size=block_size,
        partition_starts_by_ref=tuple(partition_starts),
        root_icb=parse_long_ad(file_set_descriptor, 0x190),
    )


def parse_udf_alloc_descriptors(
    ctx: UdfContext,
    allocation_type: int,
    partition_ref: int,
    data: bytes,
) -> tuple[UdfExtent, ...]:
    if allocation_type not in {0, 1}:
        raise ProbeError(
            f"unsupported UDF allocation descriptor type {allocation_type}"
        )

    extents: list[UdfExtent] = []
    cursor = 0
    file_offset = 0
    while cursor < len(data):
        if allocation_type == 0:
            extent_length_raw, logical_block_num = struct.unpack_from(
                "<II", data, cursor
            )
            extent_partition_ref = partition_ref
            cursor += 8
        else:
            extent_length_raw = struct.unpack_from("<I", data, cursor)[0]
            logical_block_num = struct.unpack_from("<I", data, cursor + 4)[0]
            extent_partition_ref = struct.unpack_from("<H", data, cursor + 8)[0]
            cursor += 16

        extent_length = extent_length_raw & 0x3FFFFFFF
        extent_type = extent_length_raw & 0xC0000000
        if extent_length == 0:
            continue
        if extent_type != 0:
            raise ProbeError(f"unsupported UDF extent type 0x{extent_type:x}")

        extents.append(
            UdfExtent(
                file_offset=file_offset,
                physical_offset=block_offset(
                    ctx, logical_block_num, extent_partition_ref
                ),
                length=extent_length,
            )
        )
        file_offset += extent_length

    return tuple(extents)


def read_udf_file_entry(
    reader: HttpRangeReader, ctx: UdfContext, icb: UdfLongAd
) -> UdfFileEntry:
    data = reader.read_at(
        block_offset(ctx, icb.logical_block_num, icb.partition_ref),
        ctx.block_size,
    )
    descriptor_id = tag_id(data)
    if descriptor_id == 0x0105:
        info_length = struct.unpack_from("<Q", data, 0x38)[0]
        extra_attr_length = struct.unpack_from("<I", data, 0xA8)[0]
        alloc_desc_length = struct.unpack_from("<I", data, 0xAC)[0]
        alloc_desc_offset = 0xB0 + extra_attr_length
    elif descriptor_id == 0x010A:
        info_length = struct.unpack_from("<Q", data, 0x38)[0]
        extra_attr_length = struct.unpack_from("<I", data, 0xD0)[0]
        alloc_desc_length = struct.unpack_from("<I", data, 0xD4)[0]
        alloc_desc_offset = 0xD8 + extra_attr_length
    else:
        raise ProbeError(f"unexpected file entry descriptor 0x{descriptor_id:x}")

    icb_flags = struct.unpack_from("<H", data, 0x10 + 18)[0]
    allocation_type = icb_flags & 0x0007
    alloc_descs = data[alloc_desc_offset : alloc_desc_offset + alloc_desc_length]

    return UdfFileEntry(
        info_length=info_length,
        extents=parse_udf_alloc_descriptors(
            ctx, allocation_type, icb.partition_ref, alloc_descs
        ),
    )


def decode_osta_cs0(raw: bytes) -> str:
    if not raw:
        return ""
    if raw[0] == 8:
        return raw[1:].decode("latin-1")
    if raw[0] == 16:
        return raw[1:].decode("utf-16-be")
    raise ProbeError(f"unsupported OSTA CS0 compression id {raw[0]}")


def list_udf_directory(
    reader: HttpRangeReader,
    ctx: UdfContext,
    entry: UdfFileEntry,
) -> list[UdfFileIdentifier]:
    data = ExtentMappedReader(reader, entry.extents, entry.info_length).read_at(
        0, entry.info_length
    )
    items: list[UdfFileIdentifier] = []
    offset = 0
    while offset + 38 <= len(data):
        if data[offset : offset + 16] == b"\x00" * 16:
            break
        if tag_id(data, offset) != 0x0101:
            if all(byte == 0 for byte in data[offset:]):
                break
            raise ProbeError(
                f"unexpected directory record tag 0x{tag_id(data, offset):x}"
            )

        file_ident_length = data[offset + 0x13]
        child_icb = parse_long_ad(data, offset + 0x14)
        implementation_use_length = struct.unpack_from("<H", data, offset + 0x24)[0]
        name_offset = offset + 0x26 + implementation_use_length
        total_length = align_up(38 + implementation_use_length + file_ident_length, 4)
        items.append(
            UdfFileIdentifier(
                name=decode_osta_cs0(
                    data[name_offset : name_offset + file_ident_length]
                ),
                file_characteristics=data[offset + 0x12],
                icb=child_icb,
            )
        )
        offset += total_length
    return items


def find_udf_file_entry(reader: HttpRangeReader, path: str) -> UdfFileEntry:
    ctx = read_udf_context(reader)
    current = read_udf_file_entry(reader, ctx, ctx.root_icb)

    for part in split_path(path):
        entries = list_udf_directory(reader, ctx, current)
        match = find_named_child(entries, part, skip_parent=True)
        if match is None:
            raise ProbeError(
                f"UDF path component {part!r} not found; sample entries: {sample_names(entries, skip_parent=True)}"
            )
        current = read_udf_file_entry(reader, ctx, match.icb)

    return current
