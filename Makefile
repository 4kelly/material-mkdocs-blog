.PHONY: cloudflare
cloudflare:
	# Install Poetry
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
	# Install Dependencies
	poetry shell
	poetry install
	mkdocs build
