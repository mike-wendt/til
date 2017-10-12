# Assign External Static IPs

Add a new target address to the host interface, assuming `em1`
```
$ sudo ip addr add 10.12.224.117/23 dev em1
```

Run docker with `-p` option to bind to exposed ports
```
$ docker run -d --name web -p 10.12.0.117:80:80 nginx
```

### Permanent Setup
After reboot the addition IP will not be added, the
`/etc/network/interfaces` file needs to be modified to make the changes
permanent

For each new IP add, with increasing numbers for the aliases (number after
`:`)
```
iface em1:1 inet static
    address 10.17.224.117
    network 10.17.224.0
    netmask 255.255.254.0
```

Modify this line:
```
auto em1
```
To include all of the additional IP aliases:
```
auto em1 em1:1 em1:2
```

### Notes
Setting up something like GitLab requires ports 22, 80, 443 and by
default SSH & Apache2 listen on all IPs so they need to be restricted
to use the other IP and the same ports

### Source
* http://blog.oddbit.com/2014/08/11/four-ways-to-connect-a-docker/
