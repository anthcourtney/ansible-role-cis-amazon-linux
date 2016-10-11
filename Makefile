ANSIBLE_TEST_PLAYBOOK_FILE = playbook.yml

syntax:
	cd tests && ansible-playbook --syntax-check -i localhost, $(ANSIBLE_TEST_PLAYBOOK_FILE)

review:
	git ls-files | xargs ansible-review -c tests/ansible-review/config.ini
