# Clipboard Stops Working

### Shared Clipboard Breaks with Linux

One liner to restart service so you can copy away:

```
pkill -f VBoxClient; VBoxClient --clipboard
```

### Source
* https://superuser.com/questions/536827/virtualbox-bidirectional-clipboard-sharing-stops-working-after-some-time-on-a-li#790925
