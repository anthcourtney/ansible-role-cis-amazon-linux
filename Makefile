ANSIBLE_TEST_PLAYBOOK_FILE = playbook.yml
ANSIBLE_CONTAINER_PLAYBOOK_FILE = container.yml

symlink-role:
	@mkdir -p tests/roles 
	@rsync -a . tests/roles/anthcourtney.cis-amazon-linux --exclude 'tests/' --exclude '.git'

test: symlink-role syntax test-ansible-2.0.2 test-ansible-2.1.3 test-ansible-2.2

test-ansible-2.0.2:
	cd tests && ansible-playbook -i localhost, $(ANSIBLE_CONTAINER_PLAYBOOK_FILE) --e "test_ansible_version=2.0.2"

test-ansible-2.1.3:
	cd tests && ansible-playbook -i localhost, $(ANSIBLE_CONTAINER_PLAYBOOK_FILE) --e "test_ansible_version=2.1.3"

test-ansible-2.2:
	cd tests && ansible-playbook -i localhost, $(ANSIBLE_CONTAINER_PLAYBOOK_FILE) --e "test_ansible_version=2.2"

syntax:
	cd tests && ansible-playbook --syntax-check -i localhost, $(ANSIBLE_TEST_PLAYBOOK_FILE)

review:
	git ls-files | xargs ansible-review -c tests/ansible-review/config.ini
