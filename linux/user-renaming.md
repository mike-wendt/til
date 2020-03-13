# User Renaming

If user `foo` exists and needs to renamed to `bar` the following renames both the user, group, and home directory.

```
sudo usermod -l bar foo
sudo usermod -d /home/bar -m bar
sudo groupmod -n bar foo
```

#### Source
- https://linuxtechlab.com/rename-user-in-linux-rename-home-directory/
