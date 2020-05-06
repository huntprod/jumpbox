IMAGE := huntprod/jumpbox

build:
	docker build . -f Dockerfile       -t $(IMAGE):latest
	docker build . -f Dockerfile.jhunt -t $(IMAGE):jhunt

push:
	docker push $(IMAGE):latest
	docker push $(IMAGE):jhunt
