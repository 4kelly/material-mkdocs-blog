.PHONY: cloudflare
cloudflare:
	# Install Poetry
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
	# Configure Poetry
	$(shell source $HOME/.poetry/env)
	poetry shell
    # Install Dependencies
	poetry install
	mkdocs build
