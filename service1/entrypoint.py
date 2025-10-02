import sys
import datetime

lines = sys.stdin.read().splitlines()
if lines and  lines[0].strip() == "timestamp":
    format_type = "timestamp"
else:
    format_type = "iso"
#format_type = lines[0].strip() if lines else "iso"

now = datetime.datetime.now(datetime.timezone.utc)

if format_type == "timestamp":
    print(str(int(now.timestamp())))
else:
    print(now.isoformat())