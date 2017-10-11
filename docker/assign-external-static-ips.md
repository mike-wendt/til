# Assign External Static IPs

```
# create a new bridge network with your subnet and gateway for your ip block
$ docker network create --subnet 203.0.113.0/24 --gateway 203.0.113.254 iptastic

# run a nginx container with a specific ip in that block
$ docker run --rm -it --net iptastic --ip 203.0.113.2 nginx
```

### Source
* https://blog.jessfraz.com/post/ips-for-all-the-things/
