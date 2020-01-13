# fio-perf-aws-vs-hetzner

Flexible I/O tester used to test IOPS and bandwidth on NVMe devices formattet with ext4.
If multiple disks are available to the machine a raid0 device has been created and used for the tests.

To perform a test, use the command below
```
docker run --rm -d --privileged=true -v /dev:/dev -v /pv-disks/772392d3-35ed-47b0-8d51-25423b12c04a/:/testfolder eu.gcr.io/brunsgaard-public/fio-tester i3en.6xlarge
```

After the test you will find `/pv-disks/772392d3-35ed-47b0-8d51-25423b12c04a/i3en.6xlarge.ioperf.tar.gz`, move this file to the datafolder and run the `python3 generate_csv_output.py`

You can install csvkit and use `csvlook` for pretty print the csv output files.
```fish
for f in (find out -type f)
    echo $f
    csvlook $f
    echo ""
end
```

### Conclusion
It is hard to do a fair comparision but is seems like latency is higher on the
AWS NVMes. The higher latency results in fewer IOPS and therefore less
throughput. Note that aws.m5d.2xlarge.ioperf.csv is the only test performed on
a single disk instead of a raid0 device with two disks. The i3en instances look
to perform okey but it is shame that you need to allocate `2 x 7,500 GB NVMe SSD`
to get that performence.

### Output numbers
Below you find the results of the experiments.

```
out/aws.i3en.6xlarge.ioperf.csv
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

out/aws.m5d.2xlarge.ioperf.csv
| jobname                    | read_iops | read_bw (MiB/s) | read_lat (usec) | write_iops | write_bw (MiB/s) | write_lat (usec) |
| -------------------------- | --------- | --------------- | --------------- | ---------- | ---------------- | ---------------- |
| mh-estimation-test         |    33,050 |             516 |          26,600 |      5,864 |               91 |           21,914 |
| google-iops-randread-perf  |   118,681 |             463 |           4,281 |          0 |                0 |                0 |
| google-iops-randwrite-perf |         0 |               0 |               0 |     57,019 |              222 |            8,908 |
| random-read-4k-blocks-1c   |    11,151 |              43 |              86 |          0 |                0 |                0 |
| random-read-4k-blocks-2c   |    22,128 |              86 |              87 |          0 |                0 |                0 |
| random-read-4k-blocks-4c   |    42,917 |             167 |              90 |          0 |                0 |                0 |
| random-read-4k-blocks-8c   |    79,621 |             311 |              97 |          0 |                0 |                0 |
| random-read-4k-blocks-16c  |   117,932 |             460 |             131 |          0 |                0 |                0 |
| random-read-4k-blocks-32c  |   117,160 |             457 |             269 |          0 |                0 |                0 |
| random-read-4k-blocks-64c  |   117,160 |             457 |             542 |          0 |                0 |                0 |
| random-read-8k-blocks-1c   |    10,445 |              81 |              92 |          0 |                0 |                0 |
| random-read-8k-blocks-2c   |    20,466 |             159 |              94 |          0 |                0 |                0 |
| random-read-8k-blocks-4c   |    38,703 |             302 |             100 |          0 |                0 |                0 |
| random-read-8k-blocks-8c   |    67,858 |             530 |             114 |          0 |                0 |                0 |
| random-read-8k-blocks-16c  |    66,135 |             516 |             238 |          0 |                0 |                0 |
| random-read-8k-blocks-32c  |    66,135 |             516 |             480 |          0 |                0 |                0 |
| random-read-8k-blocks-64c  |    66,135 |             516 |             964 |          0 |                0 |                0 |
| random-read-16k-blocks-1c  |     9,519 |             148 |             101 |          0 |                0 |                0 |
| random-read-16k-blocks-2c  |    18,596 |             290 |             104 |          0 |                0 |                0 |
| random-read-16k-blocks-4c  |    32,605 |             509 |             119 |          0 |                0 |                0 |
| random-read-16k-blocks-8c  |    79,408 |             310 |              97 |          0 |                0 |                0 |
| random-read-16k-blocks-16c |    33,067 |             516 |             480 |          0 |                0 |                0 |
| random-read-16k-blocks-32c |    33,067 |             516 |             964 |          0 |                0 |                0 |
| random-read-16k-blocks-64c |    33,066 |             516 |           1,931 |          0 |                0 |                0 |
| random-write-4k-blocks-1c  |         0 |               0 |               0 |     33,416 |              130 |               26 |
| random-write-4k-blocks-2c  |         0 |               0 |               0 |     58,278 |              227 |               31 |
| random-write-4k-blocks-4c  |         0 |               0 |               0 |     57,026 |              222 |               66 |
| random-write-4k-blocks-8c  |         0 |               0 |               0 |     57,026 |              222 |              136 |
| random-write-4k-blocks-16c |         0 |               0 |               0 |     57,026 |              222 |              277 |
| random-write-4k-blocks-32c |         0 |               0 |               0 |     57,026 |              222 |              557 |
| random-write-4k-blocks-64c |         0 |               0 |               0 |     57,024 |              222 |            1,118 |
| random-write-8k-blocks-1c  |         0 |               0 |               0 |     31,157 |              243 |               28 |
| random-write-8k-blocks-2c  |         0 |               0 |               0 |     32,173 |              251 |               58 |
| random-write-8k-blocks-4c  |         0 |               0 |               0 |     32,173 |              251 |              120 |
| random-write-8k-blocks-8c  |         0 |               0 |               0 |     32,173 |              251 |              245 |
| random-write-8k-blocks-16c |         0 |               0 |               0 |     32,173 |              251 |              493 |
| random-write-8k-blocks-32c |         0 |               0 |               0 |     32,173 |              251 |              990 |
| random-write-8k-blocks-64c |         0 |               0 |               0 |     32,172 |              251 |            1,985 |

out/hetzner.EX52-NVMe.ioperf.csv
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

out/hetzner.px-92.ioperf.csv
| jobname                    | read_iops | read_bw (MiB/s) | read_lat (usec) | write_iops | write_bw (MiB/s) | write_lat (usec) |
| -------------------------- | --------- | --------------- | --------------- | ---------- | ---------------- | ---------------- |
| mh-estimation-test         |   119,356 |           1,865 |           7,270 |     21,092 |              329 |            6,669 |
| google-iops-randread-perf  |   669,721 |           2,616 |             759 |          0 |                0 |                0 |
| google-iops-randwrite-perf |         0 |               0 |               0 |    340,278 |            1,329 |            1,498 |
| random-read-4k-blocks-1c   |    11,363 |              44 |              79 |          0 |                0 |                0 |
| random-read-4k-blocks-2c   |    22,470 |              87 |              80 |          0 |                0 |                0 |
| random-read-4k-blocks-4c   |    46,448 |             181 |              79 |          0 |                0 |                0 |
| random-read-4k-blocks-8c   |    99,544 |             388 |              77 |          0 |                0 |                0 |
| random-read-4k-blocks-16c  |   189,489 |             740 |              81 |          0 |                0 |                0 |
| random-read-4k-blocks-32c  |   276,488 |           1,080 |             112 |          0 |                0 |                0 |
| random-read-4k-blocks-64c  |   279,695 |           1,092 |             226 |          0 |                0 |                0 |
| random-read-8k-blocks-1c   |    10,683 |              83 |              84 |          0 |                0 |                0 |
| random-read-8k-blocks-2c   |    21,052 |             164 |              85 |          0 |                0 |                0 |
| random-read-8k-blocks-4c   |    42,419 |             331 |              87 |          0 |                0 |                0 |
| random-read-8k-blocks-8c   |    86,970 |             679 |              88 |          0 |                0 |                0 |
| random-read-8k-blocks-16c  |   156,647 |           1,223 |              99 |          0 |                0 |                0 |
| random-read-8k-blocks-32c  |   245,918 |           1,921 |             127 |          0 |                0 |                0 |
| random-read-8k-blocks-64c  |   270,419 |           2,112 |             233 |          0 |                0 |                0 |
| random-read-16k-blocks-1c  |     9,945 |             155 |              90 |          0 |                0 |                0 |
| random-read-16k-blocks-2c  |    19,531 |             305 |              92 |          0 |                0 |                0 |
| random-read-16k-blocks-4c  |    37,728 |             589 |              97 |          0 |                0 |                0 |
| random-read-16k-blocks-8c  |    99,659 |             389 |              77 |          0 |                0 |                0 |
| random-read-16k-blocks-16c |   115,920 |           1,811 |             134 |          0 |                0 |                0 |
| random-read-16k-blocks-32c |   164,679 |           2,573 |             191 |          0 |                0 |                0 |
| random-read-16k-blocks-64c |   203,199 |           3,175 |             311 |          0 |                0 |                0 |
| random-write-4k-blocks-1c  |         0 |               0 |               0 |     58,138 |              227 |               13 |
| random-write-4k-blocks-2c  |         0 |               0 |               0 |     96,168 |              375 |               17 |
| random-write-4k-blocks-4c  |         0 |               0 |               0 |    250,684 |              979 |               13 |
| random-write-4k-blocks-8c  |         0 |               0 |               0 |    258,831 |            1,011 |               27 |
| random-write-4k-blocks-16c |         0 |               0 |               0 |    257,797 |            1,007 |               59 |
| random-write-4k-blocks-32c |         0 |               0 |               0 |    258,292 |            1,008 |              120 |
| random-write-4k-blocks-64c |         0 |               0 |               0 |    257,851 |            1,007 |              245 |
| random-write-8k-blocks-1c  |         0 |               0 |               0 |     49,097 |              383 |               15 |
| random-write-8k-blocks-2c  |         0 |               0 |               0 |    114,580 |              895 |               14 |
| random-write-8k-blocks-4c  |         0 |               0 |               0 |    214,969 |            1,679 |               15 |
| random-write-8k-blocks-8c  |         0 |               0 |               0 |    228,999 |            1,789 |               31 |
| random-write-8k-blocks-16c |         0 |               0 |               0 |    238,737 |            1,865 |               63 |
| random-write-8k-blocks-32c |         0 |               0 |               0 |    244,588 |            1,910 |              127 |
| random-write-8k-blocks-64c |         0 |               0 |               0 |    239,822 |            1,873 |              263 |
```

# Helpfull links:

- https://wiki.mikejung.biz/Benchmarking
