# SPDX-License-Identifier: 0BSD

import math

import semchunk


DETERMINISTIC_TEXT = "ThisIs\tATest."
DETERMINISTIC_CHUNK_SIZE = 4


def count_words(value: str) -> int:
    return len(value.split())


token_counters = {
    "word": count_words,
    "char": len,
}
expected_chunks = {
    "word": ["ThisIs\tATest."],
    "char": ["This", "Is", "ATes", "t."],
}
expected_offsets = {
    "word": [(0, 13)],
    "char": [(0, 4), (4, 6), (7, 11), (11, 13)],
}

for name, token_counter in token_counters.items():
    chunker = semchunk.chunkerify(token_counter, DETERMINISTIC_CHUNK_SIZE)

    assert chunker(DETERMINISTIC_TEXT) == expected_chunks[name]

    chunks, offsets = chunker(DETERMINISTIC_TEXT, offsets=True)
    assert chunks == expected_chunks[name]
    assert offsets == expected_offsets[name]
    assert chunks == [DETERMINISTIC_TEXT[start:end] for start, end in offsets]

    chunks, offsets = semchunk.chunk(
        DETERMINISTIC_TEXT,
        DETERMINISTIC_CHUNK_SIZE,
        token_counter,
        memoize=True,
        offsets=True,
    )
    assert chunks == expected_chunks[name]
    assert offsets == expected_offsets[name]

    assert chunker([DETERMINISTIC_TEXT, DETERMINISTIC_TEXT]) == [expected_chunks[name], expected_chunks[name]]
    assert chunker([DETERMINISTIC_TEXT, DETERMINISTIC_TEXT], processes=2) == [
        expected_chunks[name],
        expected_chunks[name],
    ]

    multi_chunks, multi_offsets = chunker(
        [DETERMINISTIC_TEXT, DETERMINISTIC_TEXT],
        offsets=True,
        processes=2,
    )
    assert multi_chunks == [expected_chunks[name], expected_chunks[name]]
    assert multi_offsets == [expected_offsets[name], expected_offsets[name]]

    low_overlap_chunks = chunker(DETERMINISTIC_TEXT, overlap=0.1)
    high_overlap_chunks, high_overlap_offsets = chunker(
        DETERMINISTIC_TEXT,
        overlap=math.ceil(DETERMINISTIC_CHUNK_SIZE * 0.9),
        offsets=True,
    )
    assert high_overlap_chunks == [DETERMINISTIC_TEXT[start:end] for start, end in high_overlap_offsets]

    if name == "word":
        assert len(high_overlap_chunks) == len(low_overlap_chunks)
    else:
        assert len(high_overlap_chunks) > len(low_overlap_chunks)

# Exercise the splitter paths optimized in 4.1.1 with single and repeated
# whitespace, punctuation, and text without structural splitters.
for sample in (
    "Alpha beta gamma delta.",
    "Alpha. Beta! Gamma? Delta.",
    "Alpha\nBeta\n\nGamma\r\n\r\nDelta",
    "Alpha\tBeta\t\tGamma",
    "NoWhitespaceAtAll",
):
    chunks, offsets = semchunk.chunk(sample, 8, len, offsets=True)
    assert chunks
    assert all(chunk and len(chunk) <= 8 and not chunk.isspace() for chunk in chunks)
    assert chunks == [sample[start:end] for start, end in offsets]
    assert "".join("".join(chunks).split()) == "".join(sample.split())

try:
    semchunk.chunkerify(count_words)
except ValueError:
    pass
else:
    raise AssertionError("chunkerify() accepted a token counter without a chunk size")

assert semchunk.chunk("", 512, len) == []
assert semchunk.chunk("\n\n", 512, len) == []
