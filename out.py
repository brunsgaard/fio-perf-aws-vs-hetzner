import csv
import glob
import json
import sys
import os
import tarfile


for f in glob.iglob("runs/*.tar.gz"):
    out = []
    os.makedirs("out", exist_ok=True)

    with tarfile.open(f) as tar:
        with tar.extractfile("./fio.json") as fo:
            data = json.load(fo)

    for job in data["jobs"]:
        entry = {"jobname": job['jobname']}
        entry["read_iops"] = int(job['read']['iops'])
        entry["read_bw (MiB/s)"] = int(job['read']['bw'] / 1024)
        entry["read_lat (usec)"] = int(job['read']['clat_ns']['mean'] / 1000)

        entry["write_iops"] = int(job['write']['iops'])
        entry["write_bw (MiB/s)"] = int(job['write']['bw'] / 1024)
        entry["write_lat (usec)"] = int(job['write']['clat_ns']['mean'] / 1000)
        out.append(entry)

    out_csv = 'out/' + os.path.basename(f).split(".", 1)[0] + ".csv"
    with open(out_csv, 'w', newline='') as csvfile:
        fieldnames=out[1].keys()
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for row in out:
            writer.writerow(row)
