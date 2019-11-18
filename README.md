Ansible Vault (dockerized)
===

Just a minimalistic
[Docker image](https://hub.docker.com/repository/docker/damlys/ansible-vault)
with the
[Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html)
tool.

```console
$ docker run damlys/ansible-vault:2.5.1 --version
ansible-vault 2.5.1
```

## Example usage

Create a secret file:

```console
$ echo 'Password123' > ./secret.txt

$ cat ./secret.txt
Password123
```

Encrypt the secret file:

```console
$ docker run \
  --interactive \
  --tty \
  --rm \
  --user="1000:1000" \
  --network="none" \
  --mount="type=bind,source=$(pwd),destination=/workspace" \
  damlys/ansible-vault:2.5.1 \
  encrypt ./secret.txt
New Vault password:
Confirm New Vault password:
Encryption successful

$ cat ./secret.txt
$ANSIBLE_VAULT;1.1;AES256
30616266316333363738356363326435373139353834636464643139656230306634316431366465
3231643530666263623631343564343938393865346138370a383934343965633864393865383331
66616565363365646337656537376435336430313033353532393532626361326566306562643730
3536623063643035620a306661323530363365366266633665653234343530613533313934333538
6338
```

Decrypt the secret file:

```console
$ docker run \
  --interactive \
  --tty \
  --rm \
  --user="1000:1000" \
  --network="none" \
  --mount="type=bind,source=$(pwd),destination=/workspace" \
  damlys/ansible-vault:2.5.1 \
  decrypt ./secret.txt
Vault password:
Decryption successful

$ cat ./secret.txt
Password123
```
