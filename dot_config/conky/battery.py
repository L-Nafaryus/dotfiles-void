#!/usr/bin/env python
# -*- coding: utf-8 -*-

if __name__ == "__main__":
    import subprocess
    output = ""

    p = subprocess.run(
        ["acpi", "-V"],
        stdout = subprocess.PIPE,
        stderr = subprocess.PIPE,
        text = True
    )

    if p.returncode == 0:
        info = {}

        for line in p.stdout.strip().split("\n"):
            k, v = line.split(": ")

            if not info.get(k):
                info[k] = v

        status, percent = info["Battery 0"].split(", ")
        output = "Status: {}\nCurrent: {}\nAdapter: {}".format(status, percent, info["Adapter 0"])

    print(output.strip())
