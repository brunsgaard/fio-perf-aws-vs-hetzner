# fio-perf-aws-vs-hetzner

```
docker run --rm -d --privileged=true -v /dev:/dev -v /pv-disks/772392d3-35ed-47b0-8d51-25423b12c04a/:/testfolder eu.gcr.io/brunsgaard-public/fio-tester i3en.6xlarge
```

```fish
for f in (find out -type f)
    echo $f
    csvlook $f
    echo ""
end
```
