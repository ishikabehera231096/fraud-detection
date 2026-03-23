.PHONY: setup train serve test lint clean

setup:
	python -m venv .venv && \
	. .venv/bin/activate && \
	pip install -e ".[dev]"

train:
	python -m src.pipeline.train

serve:
	uvicorn src.api.main:app --reload --port 8000

test:
	pytest tests/ -v --cov=src --cov-report=term-missing

lint:
	ruff check src/ tests/
	ruff format src/ tests/

clean:
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -name "*.pyc" -delete
	rm -rf .pytest_cache
```

---
