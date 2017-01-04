
deploy:
	mkdocs build --clean
	aws s3 sync --profile personal ./site/ s3://docs.amon.cx --acl public-read --exclude "*.py*" --delete
