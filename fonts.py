from __future__ import annotations

import base64
import hashlib
import urllib.error
import urllib.request
import xml.etree.ElementTree as ET
from dataclasses import dataclass
from pathlib import Path

from wu import (
    Fe3Client,
    ResolverError,
    WINDOWS_UPDATE_USER_AGENT,
    WU_NS,
    build_windows_update_ssl_context,
    first_element,
    iter_elements,
    parse_xml_document,
    parse_xml_fragment,
)


@dataclass(frozen=True)
class CabEntry:
    group: str
    name: str
    sha1_b64: str
    sha256_b64: str
    size: int
    update_id: str
    revision: int
    url: str | None = None

    @property
    def sha256_bytes(self) -> bytes:
        return base64.b64decode(self.sha256_b64)


def canonical_cab_name(group: str, cab_stem: str) -> str:
    return (
        f"Microsoft-Windows-LanguageFeatures-Fonts-{cab_stem}"
        "-Package~31bf3856ad364e35~amd64~~.cab"
    )


def parse_update_identity(xml_text: str) -> tuple[str, int] | None:
    if not xml_text.strip():
        return None
    fragment = parse_xml_fragment(xml_text, "update identity")
    identity = first_element(fragment, "UpdateIdentity")
    if identity is None:
        return None

    update_id = identity.get("UpdateID")
    revision_text = identity.get("RevisionNumber")
    if not update_id or revision_text is None:
        return None

    try:
        return update_id, int(revision_text)
    except ValueError as exc:
        raise ResolverError(f"invalid revision number {revision_text!r}") from exc


def file_sha256_digest(file_element: ET.Element) -> str | None:
    for child in file_element:
        if child.tag.rsplit("}", 1)[-1] != "AdditionalDigest":
            continue
        if child.get("Algorithm") != "SHA256" or child.text is None:
            continue
        return child.text.strip()
    return None


def parse_cab_entries(
    sync_response: str,
    group_to_cab_stem: dict[str, str],
) -> dict[str, CabEntry]:
    expected = {
        canonical_cab_name(group, cab_stem): group
        for group, cab_stem in group_to_cab_stem.items()
    }
    root = parse_xml_document(sync_response, "SyncUpdates response")
    identities: dict[str, tuple[str, int]] = {}
    entries: dict[str, CabEntry] = {}

    for update_info in root.findall(".//w:UpdateInfo", WU_NS):
        service_id = update_info.findtext("w:ID", default="", namespaces=WU_NS)
        xml_text = update_info.findtext("w:Xml", default="", namespaces=WU_NS)
        identity = parse_update_identity(xml_text)
        if identity is None:
            continue
        identities[service_id] = identity

    for update in root.findall(".//w:Update", WU_NS):
        service_id = update.findtext("w:ID", default="", namespaces=WU_NS)
        identity = identities.get(service_id)
        if identity is None:
            continue

        xml_text = update.findtext("w:Xml", default="", namespaces=WU_NS)
        if not xml_text.strip():
            continue
        fragment = parse_xml_fragment(xml_text, f"update {service_id}")
        for file_element in iter_elements(fragment, "File"):
            name = file_element.get("FileName")
            if not name:
                continue
            group = expected.get(name)
            if group is None:
                continue

            if file_element.get("DigestAlgorithm") != "SHA1":
                continue

            sha1 = file_element.get("Digest")
            size_text = file_element.get("Size")
            sha256 = file_sha256_digest(file_element)
            if sha1 is None or size_text is None or sha256 is None:
                continue

            try:
                size = int(size_text)
            except ValueError as exc:
                raise ResolverError(
                    f"invalid CAB size {size_text!r} for {name}"
                ) from exc

            current = entries.get(group)
            if current is not None and (current.revision, current.size) >= (
                identity[1],
                size,
            ):
                continue

            entries[group] = CabEntry(
                group=group,
                name=name,
                sha1_b64=sha1,
                sha256_b64=sha256,
                size=size,
                update_id=identity[0],
                revision=identity[1],
            )

    return entries


def resolve_groups(
    build: str,
    group_specs: list[tuple[str, str]],
    branch: str | None = None,
) -> list[CabEntry]:
    client = Fe3Client(build, branch=branch)
    group_to_cab_stem = dict(group_specs)
    all_entries = parse_cab_entries(client.sync_updates(), group_to_cab_stem)
    resolved: list[CabEntry] = []
    missing: list[str] = []

    for group, cab_stem in group_specs:
        entry = all_entries.get(group)
        if entry is None:
            missing.append(canonical_cab_name(group, cab_stem))
            continue
        resolved.append(entry)

    if missing:
        raise ResolverError("missing CAB metadata for: " + ", ".join(missing))

    urls = client.get_file_urls(resolved)
    final_entries: list[CabEntry] = []
    unresolved: list[str] = []
    for entry in resolved:
        url = urls.get(entry.sha1_b64)
        if url is None:
            unresolved.append(entry.name)
            continue
        final_entries.append(
            CabEntry(
                group=entry.group,
                name=entry.name,
                sha1_b64=entry.sha1_b64,
                sha256_b64=entry.sha256_b64,
                size=entry.size,
                update_id=entry.update_id,
                revision=entry.revision,
                url=url,
            )
        )

    if unresolved:
        raise ResolverError("missing download URLs for: " + ", ".join(unresolved))

    return final_entries


def verify_file(path: Path, expected_sha256: bytes) -> bool:
    digest = hashlib.sha256()
    try:
        with path.open("rb") as handle:
            while True:
                chunk = handle.read(1024 * 1024)
                if not chunk:
                    break
                digest.update(chunk)
    except OSError as exc:
        raise ResolverError(f"failed to read {path.name}: {exc}") from exc
    return digest.digest() == expected_sha256


def download_entry(entry: CabEntry, output_dir: Path) -> None:
    if entry.url is None:
        raise ResolverError(f"no download URL for {entry.name}")

    destination = output_dir / entry.name
    if destination.exists() and verify_file(destination, entry.sha256_bytes):
        print(f"- Reusing {entry.name}")
        return

    temp_path = destination.with_suffix(destination.suffix + ".part")
    digest = hashlib.sha256()
    request = urllib.request.Request(
        entry.url,
        headers={"User-Agent": WINDOWS_UPDATE_USER_AGENT},
    )
    completed = False

    print(f"- Downloading {entry.name}")
    try:
        with (
            urllib.request.urlopen(
                request,
                context=build_windows_update_ssl_context(),
                timeout=300,
            ) as response,
            temp_path.open("wb") as handle,
        ):
            while True:
                chunk = response.read(1024 * 1024)
                if not chunk:
                    break
                digest.update(chunk)
                handle.write(chunk)

        if digest.digest() != entry.sha256_bytes:
            raise ResolverError(f"SHA256 mismatch for {entry.name}")

        temp_path.replace(destination)
        completed = True
    except ResolverError:
        raise
    except urllib.error.HTTPError as exc:
        raise ResolverError(
            f"failed to download {entry.name}: HTTP {exc.code}"
        ) from exc
    except (urllib.error.URLError, OSError) as exc:
        raise ResolverError(f"failed to download {entry.name}: {exc}") from exc
    finally:
        if not completed:
            temp_path.unlink(missing_ok=True)
