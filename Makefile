ANSIBLE_TEST_PLAYBOOK_FILE = playbook.yml
ANSIBLE_CONTAINER_PLAYBOOK_FILE = container.yml

symlink-role:
	@mkdir -p tests/roles 
	@rsync -a . tests/roles/anthcourtney.cis-amazon-linux --exclude 'tests/' --exclude '.git'

test: symlink-role syntax test-ansible

test-ansible-2.5:
	cd tests && ansible-playbook -i localhost, $(ANSIBLE_CONTAINER_PLAYBOOK_FILE) --e "test_ansible_version=2.5.9"

test-ansible-2.6:
	cd tests && ansible-playbook -i localhost, $(ANSIBLE_CONTAINER_PLAYBOOK_FILE) --e "test_ansible_version=2.6.5"

test-ansible-2.7:
	cd tests && ansible-playbook -i localhost, $(ANSIBLE_CONTAINER_PLAYBOOK_FILE) --e "test_ansible_version=2.7"
	
test-ansible-travis:
	cd tests && ansible-playbook -i localhost, $(ANSIBLE_TEST_PLAYBOOK_FILE)

syntax:
	cd tests && ansible-playbook --syntax-check -i localhost, $(ANSIBLE_TEST_PLAYBOOK_FILE)

review:
	git ls-files defaults/ | xargs ansible-review -c tests/ansible-review/config.ini
	git ls-files handlers/ | xargs ansible-review -c tests/ansible-review/config.ini
	git ls-files meta/ | xargs ansible-review -c tests/ansible-review/config.ini
	git ls-files vars/ | xargs ansible-review -c tests/ansible-review/config.ini
	git ls-files tasks/ | xargs ansible-review -c tests/ansible-review/config.ini
