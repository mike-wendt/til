# Assign External Static IPs

Add a new target address to the host interface
```
$ sudo ip addr add 10.12.0.117/21 dev em1
```

Run docker with `-p` option to bind to exposed ports
```
$ docker run -d --name web -p 10.12.0.117:80:80 nginx
```

#### Notes
Setting up something like GitLab requires ports 22, 80, 443 and by
default SSH & Apache2 listen on all IPs so they need to be restricted
to use the other IP and the same ports

### Source
* http://blog.oddbit.com/2014/08/11/four-ways-to-connect-a-docker/
