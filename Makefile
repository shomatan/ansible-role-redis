DOCKER_IMAGE_NAME=redis-test-image
DOCKER_CONTAINER_NAME=redis-test
PLAYBOOK_CMD=ansible-playbook redis/tests/test.yml -i redis/tests/inventory

.PHONY: build
build:
	docker build ./tests -t $(DOCKER_IMAGE_NAME)

.PHONY: run-container
run-container: build
	-docker run -d -v ${PWD}:/test/redis \
		--name $(DOCKER_CONTAINER_NAME) \
		--privileged $(DOCKER_IMAGE_NAME) \
		/sbin/init

.PHONY: check
check: run-container
	docker exec -it $(DOCKER_CONTAINER_NAME) $(PLAYBOOK_CMD) --syntax-check

.PHONY: test
test: check
	docker exec -it $(DOCKER_CONTAINER_NAME) $(PLAYBOOK_CMD)

.PHONY: clean
clean:
	-@docker rm -f $(DOCKER_CONTAINER_NAME)

.PHONY: destroy
destroy: clean
