ANSIBLE_TEST_PLAYBOOK_FILE = tests/playbook.yml

syntax:
	ansible-playbook --syntax-check -i localhost, $(ANSIBLE_TEST_PLAYBOOK_FILE)
