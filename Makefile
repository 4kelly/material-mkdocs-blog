.PHONY: cloudflare
cloudflare:
	# Install deps
	pip install -r requirements.txt
	# build site
	mkdocs build
