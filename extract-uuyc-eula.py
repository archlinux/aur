#!/usr/bin/env python3

from __future__ import annotations

import hashlib
import html
import re
import sys
import unicodedata
from dataclasses import dataclass, field
from html.parser import HTMLParser
from pathlib import Path

TITLE = "网易UU远程软件许可及服务协议"
SOURCE_TAGS = frozenset({"br", "p", "span", "strong"})
SPAN_STYLE_PROPERTIES = frozenset({"font-family", "font-size"})


@dataclass
class Element:
    tag: str
    attrs: dict[str, str]
    children: list[Element | str] = field(default_factory=list)


class AgreementDomParser(HTMLParser):
    def __init__(self) -> None:
        super().__init__(convert_charrefs=True)
        self.root: Element | None = None
        self.stack: list[Element] = []
        self.active = False
        self.complete = False

    @staticmethod
    def _validated_attributes(
        tag: str, attrs: list[tuple[str, str | None]]
    ) -> dict[str, str]:
        attributes = {name.lower(): value or "" for name, value in attrs}
        if tag != "span":
            if attributes:
                raise ValueError(f"unsupported attributes on EULA <{tag}> tag")
            return attributes

        if set(attributes) != {"style"}:
            raise ValueError("EULA <span> must contain only a style attribute")
        declarations = {}
        for declaration in attributes["style"].split(";"):
            name, separator, value = declaration.partition(":")
            if separator:
                declarations[name.strip().lower()] = value.strip()
        if not declarations or not set(declarations) <= SPAN_STYLE_PROPERTIES:
            raise ValueError("unsupported semantic style in EULA <span> tag")
        return attributes

    def handle_starttag(
        self, tag: str, attrs: list[tuple[str, str | None]]
    ) -> None:
        tag = tag.lower()
        attributes = {name.lower(): value or "" for name, value in attrs}
        if not self.active:
            classes = attributes.get("class", "").split()
            if self.root is None and tag == "div" and "news-article" in classes:
                self.root = Element("root", {})
                self.stack = [self.root]
                self.active = True
            return

        if tag not in SOURCE_TAGS:
            raise ValueError(f"unsupported <{tag}> tag in UU Remote EULA body")
        validated_attributes = self._validated_attributes(tag, attrs)
        element = Element(tag, validated_attributes)
        self.stack[-1].children.append(element)
        if tag != "br":
            self.stack.append(element)

    def handle_startendtag(
        self, tag: str, attrs: list[tuple[str, str | None]]
    ) -> None:
        self.handle_starttag(tag, attrs)
        if self.active and tag.lower() != "br":
            self.handle_endtag(tag)

    def handle_endtag(self, tag: str) -> None:
        if not self.active:
            return
        tag = tag.lower()
        if len(self.stack) == 1:
            if tag != "div":
                raise ValueError(f"unexpected </{tag}> tag in UU Remote EULA body")
            self.stack.clear()
            self.active = False
            self.complete = True
            return

        if tag not in SOURCE_TAGS or tag == "br":
            raise ValueError(f"unsupported </{tag}> tag in UU Remote EULA body")
        if self.stack[-1].tag != tag:
            raise ValueError(f"mismatched </{tag}> tag in UU Remote EULA body")
        self.stack.pop()

    def handle_data(self, data: str) -> None:
        if self.active:
            self.stack[-1].children.append(data)

    def agreement(self) -> Element:
        if self.root is None or not self.complete or self.active or self.stack:
            raise ValueError("UU Remote EULA agreement body was not found or was incomplete")
        return self.root


def canonical_node(node: Element | str) -> str:
    if isinstance(node, str):
        if not node.strip():
            return ""
        normalized = re.sub(r"\s+", " ", unicodedata.normalize("NFC", node))
        return html.escape(normalized, quote=False)
    if node.tag == "root":
        return "".join(canonical_node(child) for child in node.children)
    if node.tag == "br":
        return "<br>"
    if node.tag == "span":
        return "".join(canonical_node(child) for child in node.children)
    if node.tag in {"p", "strong"}:
        content = "".join(canonical_node(child) for child in node.children)
        return f"<{node.tag}>{content}</{node.tag}>"
    raise ValueError(f"unsupported parsed <{node.tag}> tag in UU Remote EULA body")


def plain_node(node: Element | str) -> str:
    if isinstance(node, str):
        return re.sub(r"\s+", " ", unicodedata.normalize("NFC", node))
    if node.tag == "br":
        return "\n"
    if node.tag in {"root", "span", "strong"}:
        return "".join(plain_node(child) for child in node.children)
    if node.tag == "p":
        content = "".join(plain_node(child) for child in node.children)
        return f"\n{content}\n"
    raise ValueError(f"unsupported parsed <{node.tag}> tag in UU Remote EULA body")


def static_document(canonical_body: str) -> str:
    return f"""<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{TITLE}</title>
<style>
body {{ color: #1f2328; font: 16px/1.7 sans-serif; margin: 2rem auto; max-width: 72rem; padding: 0 1rem; }}
h1 {{ line-height: 1.25; }}
</style>
</head>
<body>
<main>
<h1>{TITLE}</h1>
{canonical_body}
</main>
</body>
</html>
"""


def verified_agreement(input_path: Path, expected_sha256: str) -> tuple[Element, str]:
    parser = AgreementDomParser()
    parser.feed(input_path.read_text(encoding="utf-8"))
    agreement = parser.agreement()
    canonical_body = re.sub(r" {2,}", " ", canonical_node(agreement)).strip()
    actual_sha256 = hashlib.sha256(canonical_body.encode("utf-8")).hexdigest()
    if actual_sha256 != expected_sha256:
        raise ValueError(
            "UU Remote EULA semantic checksum mismatch: "
            f"expected {expected_sha256}, got {actual_sha256}"
        )
    return agreement, canonical_body


def main() -> int:
    verify_only = len(sys.argv) == 4 and sys.argv[1] == "--verify-only"
    generate = len(sys.argv) == 5 and sys.argv[1] != "--verify-only"
    if not verify_only and not generate:
        program = Path(sys.argv[0]).name
        print(
            f"Usage: {program} --verify-only INPUT_HTML EXPECTED_SHA256\n"
            f"       {program} INPUT_HTML OUTPUT_HTML OUTPUT_TEXT EXPECTED_SHA256",
            file=sys.stderr,
        )
        return 2

    if verify_only:
        input_path = Path(sys.argv[2])
        expected_sha256 = sys.argv[3].lower()
    else:
        input_path = Path(sys.argv[1])
        output_html_path = Path(sys.argv[2])
        output_text_path = Path(sys.argv[3])
        expected_sha256 = sys.argv[4].lower()

    try:
        agreement, canonical_body = verified_agreement(
            input_path, expected_sha256
        )
        if verify_only:
            return 0

        plain_lines = [
            re.sub(r"\s+", " ", line).strip()
            for line in plain_node(agreement).splitlines()
            if line.strip()
        ]
        output_html_path.write_text(
            static_document(canonical_body), encoding="utf-8", newline="\n"
        )
        output_text_path.write_text(
            f"{TITLE}\n\n" + "\n".join(plain_lines) + "\n",
            encoding="utf-8",
            newline="\n",
        )
    except (OSError, UnicodeError, ValueError) as error:
        print(error, file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
