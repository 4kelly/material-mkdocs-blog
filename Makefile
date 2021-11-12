.PHONY: cloudflare
cloudflare:
	# Install Poetry
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -
	# Configure Poetry
	poetry shell
    # Install Dependencies
	poetry install
	mkdocs build
