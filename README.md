## ETCD-ENVS

Quick script to get key/values from etcd and place in an environment file.

This script takes a etcd path (eg. /config/st2) then returns the keys and their values in an environment variable format (ie. KEY=value).

## Usage

```
./etcd-envs.sh [ETCD KEY] [OUTPUT FILE]
OUTPUT FILE	default: /output/environment
```

## Example

```
# Docker example
docker run --rm -it --env-file /etc/etcd/environment -v `pwd`/output:/output panubo/etcd-envs /config/st2 /output/etcd_env
```

## TODO:

* Option to do recursive
* Option to not truncate
* Better error handling (if required?)
