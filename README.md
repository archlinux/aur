# Arabizi-Translit-Engine (MVP)

Linux-native IBus Input Method Engine for real-time transliteration from Arabizi (Latin + numbers) to Arabic.

## Features

- Lexicon-driven transliteration from `lexicon.json`
- Greedy sliding parser (3-char -> 2-char -> 1-char matching)
- Phonetic normalization for repeated vowels (`a`, `aa`, `aaa`)
- Prefix handling (`al` / `el` -> `ال`) with join behavior across word boundaries
- Definite article variants (`al`, `el`, `as`, `ar`) normalized to `ال`
- Numerical substitutions (`3 -> ع`, `7 -> ح`, `2 -> ء`, `5` or `7' -> خ`, `9 -> ص`)
- Vowel and morphology heuristics (terminal vowels, initial hamza forms)
- Real-time preedit preview while typing
- Commit on terminators (Space, Enter, punctuation)
- Backspace/escape correction flow that reveals editable Latin buffer
- Shift+Space toggle to bypass transliteration (literal mode)
- Contextual double-consonant handling for shadda-style gemination (`yalla -> يلا`)
- IBus `LookupTable` suggestions (for `keef`: `كيف`, `كيفك`, `كيفكم`)
- Dialect switcher property in IBus panel (`Default`, `Levantine`, `Egyptian`)
- Modifier passthrough for `Control`, `Alt`, and `Super`
- Bigram and dictionary fallback post-processor (`ya makan` -> `يا مكان`)

## Project Layout

- `arabizi_ibus/transliterator.py`: Mapping loader and transliteration engine
- `arabizi_ibus/linguistic_engine.py`: Offline `ArabiziEngine` and adaptive validation helpers
- `arabizi_ibus/key_processor.py`: Processor with separated `BufferState` and transliteration logic
- `arabizi_ibus/engine.py`: IBus engine implementation (`focus_in`, `focus_out`, `process_key_event`)
- `arabizi_ibus/engine_main.py`: Runtime entrypoint for IBus
- `arabizi_ibus/lexicon.json`: Data-driven prefixes, mappings, exceptions, candidates, and dialect rules
- `arabizi_ibus/common_words_1000.json`: 1,000-word fallback dictionary for snapping ambiguous forms
- `data/arabizi.xml`: IBus component file
- `tests/`: Unit tests simulating key-event streams
- `tests/test_dataset.json`: 300+ linguistic regression cases
- `tests.py`: Automated scoring and auto-refinement runner

## Dependencies (Arch Linux)

Install runtime requirements:

```bash
sudo pacman -S ibus python-gobject
```

## Install

```bash
cd /home/xoity/Desktop/projects/arabizi-ibus
chmod +x scripts/install.sh bin/arabizi-ibus-engine
sudo ./scripts/install.sh /usr /usr/share/ibus/component
ibus restart
```

Then open GNOME Settings -> Keyboard -> Input Sources and add **Arabizi Transliteration**.

## Run Tests

```bash
cd /home/xoity/Desktop/projects/arabizi-ibus
python -m unittest discover -s tests -v
python scripts/download_reliable_corpus.py
python tests.py --dataset tests/corpora/arabizi_parallel_corpus.jsonl
```

### Corpus-based regression workflow

- The downloaded corpus (`bashartalafha/Arabizi-Transliteration`, 25k+ pairs) is a real Arabizi->Arabic parallel dataset and replaces the previous synthetic-only scoring flow.
- `tests.py` now runs strict one-pass evaluation (no auto-learning/memorization), so score changes reflect true engine behavior.
- For release gates, add a minimum score target:

```bash
python tests.py --dataset tests/corpora/arabizi_parallel_corpus.jsonl --min-pass-rate 25
```

## Notes

- The transliteration strategy is intentionally rule-based and deterministic for MVP scope.
- You can refine transliteration behavior by editing `arabizi_ibus/lexicon.json`.

## Repository Metadata

- License: MIT (`LICENSE`)
- Contribution guide: `CONTRIBUTING.md`
