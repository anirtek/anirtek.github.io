.DEFAULT_GOAL := help

BUNDLE       ?= bundle
JEKYLL       ?= $(BUNDLE) exec jekyll
HOST         ?= 127.0.0.1
PORT         ?= 4000
SITE_DIR     ?= _site

.PHONY: help install update run serve drafts build incremental clean doctor open lint check tag

help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} \
		/^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Install Ruby gem dependencies via Bundler
	$(BUNDLE) install

update: ## Update gems to latest allowed versions
	$(BUNDLE) update

run: serve ## Alias for `serve`

serve: ## Run the Jekyll dev server at http://$(HOST):$(PORT)
	$(JEKYLL) serve --host $(HOST) --port $(PORT) --livereload

drafts: ## Run the dev server including posts under _drafts/
	$(JEKYLL) serve --host $(HOST) --port $(PORT) --livereload --drafts --future

build: ## Build the static site into $(SITE_DIR)
	JEKYLL_ENV=production $(JEKYLL) build

incremental: ## Run the dev server with incremental rebuilds (faster, less safe)
	$(JEKYLL) serve --host $(HOST) --port $(PORT) --livereload --incremental

clean: ## Remove the generated site and Jekyll cache
	$(JEKYLL) clean

doctor: ## Run Jekyll's site diagnostics
	$(JEKYLL) doctor

open: ## Open the running site in the default browser (macOS)
	@open http://$(HOST):$(PORT) || true

check: doctor ## Validate config & build without serving
	JEKYLL_ENV=production $(JEKYLL) build --verbose

# Usage: make tag SLUG=my-post-title TITLE="My Post Title" CATEGORY=mathematical-curiosity
tag: ## Scaffold a new post under _posts/ (requires SLUG and TITLE)
	@if [ -z "$(SLUG)" ] || [ -z "$(TITLE)" ]; then \
		echo "Usage: make tag SLUG=my-post-slug TITLE=\"My Post Title\" [CATEGORY=mathematical-curiosity]"; \
		exit 1; \
	fi; \
	CAT="$${CATEGORY:-mathematical-curiosity}"; \
	DATE=$$(date +%Y-%m-%d); \
	FILE="_posts/$${DATE}-$(SLUG).md"; \
	if [ -e "$$FILE" ]; then echo "$$FILE already exists"; exit 1; fi; \
	printf -- "---\nlayout: post\ntitle: \"%s\"\ndate: %s %s\ncategories: [%s]\ntags: []\n---\n\n" \
		"$(TITLE)" "$$(date +'%Y-%m-%d %H:%M:%S')" "$$(date +%z)" "$$CAT" > "$$FILE"; \
	echo "Created $$FILE"
