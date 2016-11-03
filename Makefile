build:
	docker build -t tuxtimo/sqlmap .

run:
	docker run -it --rm -v results:/results tuxtimo/sqlmap
