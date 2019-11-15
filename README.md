### AWX collection with vendored dependency

This doesn't quite work, but it was a fun idea.

The idea was that we would package a collection that includes
tower-cli inside of the module_utils folder.

So, just pip install ansible-tower-cli to the module_utils folder
and then package that!

fails on

```
fatal: [localhost]: FAILED! => {
    "msg": "Could not find imported module support code for tower_organization.  Looked for either tower_cli.py or module_utils.py"
}
```

Current theory is that this is not supported by Ansible core

To (not) run this correctly

```
make awesome
```

