# archlinux build for localai git version

build architectures:

- cpu
- cuda
- rocm

integrated backends:

- Audio Transcription
  - whisper
- Files
  - local-store
- GPT, Embeddings
  - llama-cpp

python backends:

- Audio Generation
  - bark
  - parler-tts
- Embeddings
  - sentencetransformers
- GPT, Embeddings
  - transformers
- Image generation
  - diffusers
- Information Ranking
  - rerankers
- Musik Generation
  - transformers-musicgen
