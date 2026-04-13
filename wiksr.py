#!/usr/bin/env python3
"""
wiksr - Terminal instant answer browser
Uses local ollama AI + Wikipedia for quick Q&A.
"""

import gzip
import json
import re
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

OLLAMA_API   = "http://localhost:11434/api/chat"
OLLAMA_MODEL = "deepseek-r1:1.5b"

WIKI_SEARCH  = "https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch={}&srlimit=1&format=json"
WIKI_SUMMARY = "https://en.wikipedia.org/api/rest_v1/page/summary/{}"

HEADERS = {"User-Agent": "wiksr/1.0 terminal-browser"}

SYSTEM_PROMPT = (
    "You are a concise encyclopedia assistant. "
    "Answer in 2-4 sentences. No markdown, no lists, plain prose only. "
    "If you don't know, say so briefly."
)


def fetch(url: str) -> bytes | None:
    req = Request(url, headers={**HEADERS, "Accept-Encoding": "gzip"})
    try:
        with urlopen(req, timeout=15) as resp:
            raw = resp.read()
            if resp.info().get("Content-Encoding") == "gzip":
                raw = gzip.decompress(raw)
            return raw
    except URLError:
        return None


def ollama_search(query: str) -> tuple[str, str] | tuple[None, None]:
    """Query local ollama. Returns (answer, label) or (None, None)."""
    payload = json.dumps({
        "model": OLLAMA_MODEL,
        "stream": False,
        "messages": [
            {"role": "system", "content": SYSTEM_PROMPT},
            {"role": "user",   "content": query},
        ],
    }).encode()

    req = Request(
        OLLAMA_API,
        data=payload,
        headers={**HEADERS, "Content-Type": "application/json"},
    )
    try:
        with urlopen(req, timeout=60) as resp:
            data = json.loads(resp.read())
    except (URLError, json.JSONDecodeError):
        return None, None

    text = data.get("message", {}).get("content", "").strip()

    # deepseek-r1 wraps reasoning in <think>…</think> — strip it
    text = re.sub(r"<think>.*?</think>", "", text, flags=re.DOTALL).strip()

    if text:
        return text, f"Answer  [dim]via ollama ({OLLAMA_MODEL})[/dim]"
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
    result, label = ollama_search(query)
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

        with console.status("[dim]Thinking...[/dim]", spinner="dots"):
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
