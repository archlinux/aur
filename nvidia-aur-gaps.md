# NVIDIA AI/ML ecosystem vs AUR — gap analysis (2026-05-29)

Checked 42 notable NVIDIA AI/ML/inference/optimization projects against official repos + AUR.

## PRESENT on Arch (17)
tensorrt, python-tensorrt-llm, python-torch-tensorrt, python-nvidia-modelopt, cutlass/python-cutlass,
python-nvidia-dali, python-nemo-toolkit, python-cuda/-core (official), python-numba-cuda (official),
python-nvmath (official), python-cudf, python-cuml, python-cugraph, python-rmm, raft/python-pylibraft,
cusparselt, cudss (official).

## ABSENT — packaging candidates (ranked by GitHub stars; all actively maintained unless noted)

### Best fit for the stack (NVIDIA training/inference optimization — "like" TensorRT-LLM/torch-tensorrt/modelopt)
- Apex                          8970★   NVIDIA/apex            — fused ops + AMP for PyTorch (CUDA/C++ build → nibi)
- Transformer Engine            3362★   NVIDIA/TransformerEngine — FP8 training; dep of NeMo/Megatron/TRT-LLM (CUDA/C++ → nibi)
- Megatron-LM / Megatron-Core  16498★   NVIDIA/Megatron-LM     — LLM training; megatron-core is mostly pure-python
- NVIDIA Dynamo                 7118★   ai-dynamo/dynamo       — next-gen distributed inference server (Rust+Python, complex)
- Triton Inference Server      10704★   triton-inference-server/server — huge C++ server (heavy/container-oriented)
- tritonclient                  691★    triton-inference-server/client — PURE-PYTHON, easy win, pairs with inference work
- nvFuser                       392★    NVIDIA/Fuser           — DL compiler (largely lives inside PyTorch now; low standalone value)

### Easy pure-Python wins
- NeMo Guardrails               6291★   NVIDIA/NeMo-Guardrails — pure python, popular
- cuEquivariance               398★    NVIDIA/cuEquivariance  — python + optional CUDA

### 3D / graphics / differentiable sim (NVIDIA AI-adjacent, active)
- Warp (warp-lang)              6704★   NVIDIA/warp            — differentiable sim; python + CUDA JIT
- Kaolin                        5094★   NVIDIAGameWorks/kaolin — 3D DL, CUDA ext
- PhysicsNeMo / Modulus         2847★   NVIDIA/physicsnemo     — physics-ML, mostly python
- CV-CUDA                       2687★   CVCUDA/CV-CUDA         — GPU image/CV ops (fits vision work)
- nvdiffrast                    1856★   NVlabs/nvdiffrast (6mo)— differentiable rendering, small CUDA ext

### Domain-specific / heavier / lower priority
- Isaac Lab                     7289★   isaac-sim/IsaacLab     — robot learning (needs Isaac Sim; heavy)
- Isaac GR00T                   7156★   NVIDIA/Isaac-GR00T     — humanoid foundation model (heavy)
- cuPyNumeric                   975★    nv-legate/cupynumeric  — distributed NumPy (needs Legate runtime)
- Legate                        240★    nv-legate/legate       — Legate runtime
- Cosmos (cosmos-predict2)      777★    nvidia-cosmos/...      — world models (THIS repo ARCHIVED; check sibling repos)
- BioNeMo                       753★    NVIDIA/bionemo-framework — drug discovery
- cuQuantum                     486★    NVIDIA/cuQuantum       — quantum sim
- cuCIM                         461★    rapidsai/cucim         — RAPIDS imaging (completes the RAPIDS set on AUR)
- Holoscan SDK                  211★    nvidia-holoscan/holoscan-sdk — edge/medical streaming
- nvImageCodec                  149★    NVIDIA/nvImageCodec    — GPU image codec (pairs with DALI)
