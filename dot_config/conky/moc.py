#!/usr/bin/env python
# -*- coding: utf-8 -*-

if __name__ == "__main__":
    import subprocess
    output = ""

    p = subprocess.run(
        ["mocp", "-i"],
        stdout = subprocess.PIPE,
        stderr = subprocess.PIPE,
        text = True
    )

    if p.returncode == 0:
        info = {}

        for line in p.stdout.strip().split("\n"):
            k, v = line.split(": ")
            info[k] = v

        output = "State: {}\n".format(info["State"])

        if not info["State"] == "STOP":
            for key in ["Artist", "Album", "SongTitle"]:
                output += "{}: {}\n".format(key, info[key])

    else:
        output = "State: EXITED"

    print(output.strip())
