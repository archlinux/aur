from lm_eval.api.instance import Instance
from lm_eval.api.metrics import mean
from lm_eval.api.task import Task
from lm_eval.config.task import TaskConfig
from lm_eval.evaluator import simple_evaluate
from lm_eval.models.dummy import DummyLM


class TinyLocalTask(Task):
    VERSION = 1
    OUTPUT_TYPE = "generate_until"
    EVAL_HARNESS_NAME = "tiny_local"

    def download(self, *args, **kwargs):
        self.dataset = {
            "test": [
                {"question": "Capital of France?", "answer": "Paris"},
                {"question": "Two plus three?", "answer": "five"},
                {"question": "Opposite of cold?", "answer": "hot"},
            ]
        }

    def __init__(self):
        super().__init__()
        self._config = TaskConfig(
            task=self.EVAL_HARNESS_NAME,
            num_fewshot=0,
            output_type=self.OUTPUT_TYPE,
            repeats=1,
        )

    def has_training_docs(self):
        return False

    def has_validation_docs(self):
        return False

    def has_test_docs(self):
        return True

    def test_docs(self):
        return self.dataset["test"]

    def doc_to_text(self, doc):
        return doc["question"] + " Answer:"

    def doc_to_target(self, doc):
        return doc["answer"]

    def construct_requests(self, doc, ctx, **kwargs):
        return Instance(
            request_type="generate_until",
            doc=doc,
            arguments=(ctx, {"until": ["\n"], "max_gen_toks": 4}),
            idx=0,
            metadata=kwargs["metadata"],
        )

    def process_results(self, doc, results):
        return {"exact_match": float(results[0].strip() == doc["answer"])}

    def aggregation(self):
        return {"exact_match": mean}

    def higher_is_better(self):
        return {"exact_match": True}


class ExactLocalLM(DummyLM):
    def generate_until(self, requests, disable_tqdm=False):
        return [request.doc["answer"] for request in requests]


result = simple_evaluate(
    model=ExactLocalLM(),
    tasks=[TinyLocalTask()],
    limit=3,
    bootstrap_iters=0,
    log_samples=True,
)
assert result is not None
metrics = result["results"]["tiny_local"]
assert metrics["exact_match,none"] == 1.0
assert len(result["samples"]["tiny_local"]) == 3
print("installed lm-eval local request/evaluation workflow: PASS", metrics)
