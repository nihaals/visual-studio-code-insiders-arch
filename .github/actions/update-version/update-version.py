import os
import re


with open('PKGBUILD') as fp:
    for line in fp.readlines():
        line = line.strip()
        current_version = re.search(r"^pkgver=(.+)$", line)
        if current_version is None:
            continue
        current_version = current_version.group(1)
        break
    else:
        raise ValueError("pkgver not found")

latest_version = os.environ['INPUT_VERSION']
latest_hash_x86_64 = os.environ['INPUT_SHA256_x86_64']

print(f'Current pkgver: {current_version}')
print(f'Latest pkgver: {latest_version}')
print(f'{latest_version} x86_64 SHA256: {latest_hash_x86_64}')

if re.search(r"^\d+$", latest_version) is None:
    print('Current version is invalid')
    exit(1)

with open('PKGBUILD') as fp:
    contents = fp.read()

if current_version != latest_version:
    contents = re.sub(r"^pkgrel=.+$", 'pkgrel=1', contents, flags=re.MULTILINE)

contents = re.sub(r"^pkgver=.+$", f'pkgver={latest_version}', contents, flags=re.MULTILINE)
contents = re.sub(r"(sha256sums_x86_64=\(\n  ').+'\n", f"\g<1>{latest_hash_x86_64}'\n", contents)

with open('PKGBUILD', 'w') as fp:
    fp.write(contents)
