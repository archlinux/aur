#!/usr/bin/env python3
"""
wiksr - Terminal instant answer browser
Uses DuckDuckGo Instant Answer API + Wikipedia for quick Q&A.
"""

import gzip
import json
import sys
from urllib.request import urlopen, Request
from urllib.parse import quote_plus
from urllib.error import URLError

try:
    from rich.console import Console
    from rich.panel import Panel
except ImportError:
    print("rich not found. Install: sudo pacman -S python-rich")
    sys.exit(1)

console = Console(width=min(100, Console().width))

DDG_API      = "https://api.duckduckgo.com/?q={}&format=json&no_html=1&skip_disambig=1"
WIKI_SEARCH  = "https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch={}&srlimit=1&format=json"
WIKI_SUMMARY = "https://en.wikipedia.org/api/rest_v1/page/summary/{}"


def fetch(url: str) -> bytes | None:
    req = Request(url, headers={
        "User-Agent": "wiksr/1.0 terminal-browser",
        "Accept-Encoding": "gzip",
    })
    try:
        with urlopen(req, timeout=10) as resp:
            raw = resp.read()
            if resp.info().get("Content-Encoding") == "gzip":
                raw = gzip.decompress(raw)
            return raw
    except URLError:
        return None


def ddg_search(query: str) -> tuple[str, str] | tuple[None, None]:
    raw = fetch(DDG_API.format(quote_plus(query)))
    if not raw:
        return None, None
    try:
        data = json.loads(raw)
    except json.JSONDecodeError:
        return None, None

    if data.get("Answer"):
        return data["Answer"], data.get("AnswerType", "Answer")

    if data.get("AbstractText"):
        src = data.get("AbstractSource", "")
        label = f"Answer  [dim]via {src}[/dim]" if src else "Answer"
        return data["AbstractText"], label

    if data.get("Definition"):
        src = data.get("DefinitionSource", "")
        label = f"Definition  [dim]via {src}[/dim]" if src else "Definition"
        return data["Definition"], label

    return None, None


def wiki_search(query: str) -> tuple[str, str] | tuple[None, None]:
    raw = fetch(WIKI_SEARCH.format(quote_plus(query)))
    if not raw:
        return None, None
    try:
        results = json.loads(raw).get("query", {}).get("search", [])
    except json.JSONDecodeError:
        return None, None
    if not results:
        return None, None

    title = results[0]["title"]
    raw = fetch(WIKI_SUMMARY.format(quote_plus(title.replace(" ", "_"))))
    if not raw:
        return None, None
    try:
        data = json.loads(raw)
    except json.JSONDecodeError:
        return None, None

    extract = data.get("extract", "").strip()
    if extract and len(extract) > 60:
        label = f"{data.get('title', title)}  [dim]via Wikipedia[/dim]"
        return extract, label
    return None, None


def search(query: str) -> tuple[str, str] | tuple[None, None]:
    result, label = ddg_search(query)
    if result:
        return result, label
    return wiki_search(query)


def main():
    console.print("[bold cyan]wiksr[/bold cyan]  [dim]instant answers — q to quit[/dim]\n")

    while True:
        try:
            query = input("? ").strip()
        except (EOFError, KeyboardInterrupt):
            console.print("\n[dim]Bye.[/dim]")
            break

        if not query:
            continue
        if query.lower() in ("q", "quit", "exit"):
            console.print("[dim]Bye.[/dim]")
            break

        with console.status("[dim]Searching...[/dim]", spinner="dots"):
            result, label = search(query)

        if result:
            console.print(
                Panel(result, title=f"[green]{label}[/green]",
                      border_style="green", padding=(1, 2))
            )
            console.print()
        else:
            console.print("[yellow]No answer found.[/yellow] "
                          "Try rephrasing or being more specific.\n")


if __name__ == "__main__":
    main()
