1.1.5 (2018-01-03)

Enhancements:

* A large number of missing checks were added. Credit: @gregnz

Bugfix:

* Added support for Amazon Linux 2017.09. Credit: @stevear22

1.1.4 (2017-04-12)

Bugfix:

* Fixed check script for check 6.1.13 so that SUID executables were found rather than executables belonging to no group. Credit: @lorensk
* Added support for Amazon Linux 2017.03. Credit: @heitorlessa

1.1.3 (2017-01-10)

Enhancement:

* Refactored auditing shell scripts to add ability to handle commented entries in ```/etc/passwd``` and ```/etc/group```, as well as optimisation of loops. Credit: @lorensk
* Improve identification of information gathering tasks to ensure execution during check mode and idempotency. Credit: @lorensk
* Minor documentation fixes. Credit: @lorensk

1.1.2 (2017-01-05)

Enhancement:

* Refactor 6.2.x tasks to support running them in check mode. Credit: @jvgutierrez.
* Refactor 5.4.2 task to support running in check mode, as well as modify approach from passively flagging manual remediation activites, to actively locking system accounts. A new list ```cis_skip_lock_users``` can be defined to indicate which system accounts should not be locked. Credit: @jvgutierrez.

1.1.1 (2017-01-01)

Enhancement:

* Support running preflight checks over SSH. Credit: @jvgutierrez.
* Add '2016.09' to supported versions for Amazon in metadata.

1.1.0 (2016-12-02)

Bugfixes:

* #1 - Role now works with Ansible 2.2.0.

1.0.0 (2016-10-11)

* Initial release.
