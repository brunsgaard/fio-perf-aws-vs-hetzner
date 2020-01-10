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

```
out/i3en.6xlarge.ioperf.tar.csv
| jobname                    | read_iops | read_bw (MiB/s) | read_lat (usec) | write_iops | write_bw (MiB/s) | write_lat (usec) |
| -------------------------- | --------- | --------------- | --------------- | ---------- | ---------------- | ---------------- |
| mh-estimation-test         |    60,660 |             948 |          14,788 |     10,707 |              167 |           11,791 |
| google-iops-randread-perf  |   325,250 |           1,270 |           1,569 |          0 |                0 |                0 |
| google-iops-randwrite-perf |         0 |               0 |               0 |    357,970 |            1,398 |            1,419 |
| random-read-4k-blocks-1c   |     9,719 |              37 |              99 |          0 |                0 |                0 |
| random-read-4k-blocks-2c   |    20,648 |              80 |              93 |          0 |                0 |                0 |
| random-read-4k-blocks-4c   |    42,202 |             164 |              91 |          0 |                0 |                0 |
| random-read-4k-blocks-8c   |    81,769 |             319 |              94 |          0 |                0 |                0 |
| random-read-4k-blocks-16c  |   141,164 |             551 |             109 |          0 |                0 |                0 |
| random-read-4k-blocks-32c  |   163,216 |             637 |             191 |          0 |                0 |                0 |
| random-read-4k-blocks-64c  |   160,478 |             626 |             393 |          0 |                0 |                0 |
| random-read-8k-blocks-1c   |     9,462 |              73 |             102 |          0 |                0 |                0 |
| random-read-8k-blocks-2c   |    18,774 |             146 |             103 |          0 |                0 |                0 |
| random-read-8k-blocks-4c   |    36,839 |             287 |             105 |          0 |                0 |                0 |
| random-read-8k-blocks-8c   |    70,186 |             548 |             110 |          0 |                0 |                0 |
| random-read-8k-blocks-16c  |   124,621 |             973 |             124 |          0 |                0 |                0 |
| random-read-8k-blocks-32c  |   155,994 |           1,218 |             199 |          0 |                0 |                0 |
| random-read-8k-blocks-64c  |   156,645 |           1,223 |             403 |          0 |                0 |                0 |
| random-read-16k-blocks-1c  |     7,958 |             124 |             122 |          0 |                0 |                0 |
| random-read-16k-blocks-2c  |    15,788 |             246 |             123 |          0 |                0 |                0 |
| random-read-16k-blocks-4c  |    30,714 |             479 |             126 |          0 |                0 |                0 |
| random-read-16k-blocks-8c  |    81,060 |             316 |              95 |          0 |                0 |                0 |
| random-read-16k-blocks-16c |    98,737 |           1,542 |             157 |          0 |                0 |                0 |
| random-read-16k-blocks-32c |    97,244 |           1,519 |             324 |          0 |                0 |                0 |
| random-read-16k-blocks-64c |    97,002 |           1,515 |             654 |          0 |                0 |                0 |
| random-write-4k-blocks-1c  |         0 |               0 |               0 |     37,365 |              145 |               23 |
| random-write-4k-blocks-2c  |         0 |               0 |               0 |     67,906 |              265 |               26 |
| random-write-4k-blocks-4c  |         0 |               0 |               0 |    110,025 |              429 |               33 |
| random-write-4k-blocks-8c  |         0 |               0 |               0 |    141,612 |              553 |               50 |
| random-write-4k-blocks-16c |         0 |               0 |               0 |    145,424 |              568 |              104 |
| random-write-4k-blocks-32c |         0 |               0 |               0 |    147,550 |              576 |              211 |
| random-write-4k-blocks-64c |         0 |               0 |               0 |    147,727 |              577 |              427 |
| random-write-8k-blocks-1c  |         0 |               0 |               0 |     35,671 |              278 |               24 |
| random-write-8k-blocks-2c  |         0 |               0 |               0 |     63,135 |              493 |               28 |
| random-write-8k-blocks-4c  |         0 |               0 |               0 |    104,559 |              816 |               34 |
| random-write-8k-blocks-8c  |         0 |               0 |               0 |    142,814 |            1,115 |               50 |
| random-write-8k-blocks-16c |         0 |               0 |               0 |    141,758 |            1,107 |              107 |
| random-write-8k-blocks-32c |         0 |               0 |               0 |    143,846 |            1,123 |              216 |
| random-write-8k-blocks-64c |         0 |               0 |               0 |    144,117 |            1,125 |              438 |

out/EX52-NVMe.ioperf.tar.csv
| jobname                    | read_iops | read_bw (MiB/s) | read_lat (usec) | write_iops | write_bw (MiB/s) | write_lat (usec) |
| -------------------------- | --------- | --------------- | --------------- | ---------- | ---------------- | ---------------- |
| mh-estimation-test         |   249,949 |           3,905 |           3,578 |     44,129 |              689 |            2,879 |
| google-iops-randread-perf  |   748,181 |           2,922 |             679 |          0 |                0 |                0 |
| google-iops-randwrite-perf |         0 |               0 |               0 |    591,688 |            2,311 |              859 |
| random-read-4k-blocks-1c   |    13,821 |              53 |              59 |          0 |                0 |                0 |
| random-read-4k-blocks-2c   |    34,133 |             133 |              53 |          0 |                0 |                0 |
| random-read-4k-blocks-4c   |    72,887 |             284 |              51 |          0 |                0 |                0 |
| random-read-4k-blocks-8c   |   146,359 |             571 |              52 |          0 |                0 |                0 |
| random-read-4k-blocks-16c  |   257,670 |           1,006 |              59 |          0 |                0 |                0 |
| random-read-4k-blocks-32c  |   277,905 |           1,085 |             112 |          0 |                0 |                0 |
| random-read-4k-blocks-64c  |   280,135 |           1,094 |             225 |          0 |                0 |                0 |
| random-read-8k-blocks-1c   |    13,369 |             104 |              61 |          0 |                0 |                0 |
| random-read-8k-blocks-2c   |    31,909 |             249 |              55 |          0 |                0 |                0 |
| random-read-8k-blocks-4c   |    69,247 |             540 |              54 |          0 |                0 |                0 |
| random-read-8k-blocks-8c   |   131,468 |           1,027 |              58 |          0 |                0 |                0 |
| random-read-8k-blocks-16c  |   222,300 |           1,736 |              69 |          0 |                0 |                0 |
| random-read-8k-blocks-32c  |   267,025 |           2,086 |             116 |          0 |                0 |                0 |
| random-read-8k-blocks-64c  |   266,610 |           2,082 |             237 |          0 |                0 |                0 |
| random-read-16k-blocks-1c  |    12,568 |             196 |              63 |          0 |                0 |                0 |
| random-read-16k-blocks-2c  |    31,330 |             489 |              57 |          0 |                0 |                0 |
| random-read-16k-blocks-4c  |    60,992 |             953 |              61 |          0 |                0 |                0 |
| random-read-16k-blocks-8c  |   146,274 |             571 |              52 |          0 |                0 |                0 |
| random-read-16k-blocks-16c |   165,752 |           2,589 |              93 |          0 |                0 |                0 |
| random-read-16k-blocks-32c |   223,951 |           3,499 |             139 |          0 |                0 |                0 |
| random-read-16k-blocks-64c |   236,067 |           3,688 |             267 |          0 |                0 |                0 |
| random-write-4k-blocks-1c  |         0 |               0 |               0 |     64,120 |              250 |               12 |
| random-write-4k-blocks-2c  |         0 |               0 |               0 |    129,264 |              504 |               12 |
| random-write-4k-blocks-4c  |         0 |               0 |               0 |    243,112 |              949 |               13 |
| random-write-4k-blocks-8c  |         0 |               0 |               0 |    253,835 |              991 |               28 |
| random-write-4k-blocks-16c |         0 |               0 |               0 |    254,459 |              993 |               59 |
| random-write-4k-blocks-32c |         0 |               0 |               0 |    255,253 |              997 |              122 |
| random-write-4k-blocks-64c |         0 |               0 |               0 |    254,592 |              994 |              248 |
| random-write-8k-blocks-1c  |         0 |               0 |               0 |     59,104 |              461 |               13 |
| random-write-8k-blocks-2c  |         0 |               0 |               0 |    117,775 |              920 |               13 |
| random-write-8k-blocks-4c  |         0 |               0 |               0 |    224,161 |            1,751 |               14 |
| random-write-8k-blocks-8c  |         0 |               0 |               0 |    239,771 |            1,873 |               30 |
| random-write-8k-blocks-16c |         0 |               0 |               0 |    239,040 |            1,867 |               63 |
| random-write-8k-blocks-32c |         0 |               0 |               0 |    241,925 |            1,890 |              128 |
| random-write-8k-blocks-64c |         0 |               0 |               0 |    241,597 |            1,887 |              261 |
```
