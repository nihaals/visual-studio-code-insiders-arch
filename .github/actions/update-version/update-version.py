import os
import re


def set_output(name: str, value: str) -> None:
    with open(os.environ['GITHUB_OUTPUT'], 'a') as fp:
        print(f'{name}={value}', file=fp)


with open('PKGBUILD') as fp:
    for line in fp.readlines():
        line = line.strip()
        current_build_number = re.search(r"^_pkgbuildnumber=(.+)$", line)
        if current_build_number is None:
            continue
        current_build_number = current_build_number.group(1)
        break
    else:
        raise ValueError("_pkgbuildnumber not found")

latest_version = os.environ['INPUT_VERSION']
latest_build_number = os.environ['INPUT_BUILD_NUMBER']
latest_hash_x86_64 = os.environ['INPUT_SHA256_x86_64']

print(f'Current build number: {current_build_number}')
print(f'Latest build number: {latest_build_number}')
print(f'Latest version: {latest_version}')
print(f'{latest_version}+{latest_build_number} x86_64 SHA256: {latest_hash_x86_64}')

if latest_build_number.isdigit() is False:
    print('Latest build number is invalid')
    exit(1)

if ' ' in latest_version or '-' in latest_version:
    print('Latest version is invalid')
    exit(1)

with open('PKGBUILD') as fp:
    contents = fp.read()

if current_build_number != latest_build_number:
    contents = re.sub(r"^pkgrel=.+$", 'pkgrel=1', contents, flags=re.MULTILINE)
    print('Updated')
    set_output('updated', 'true')
else:
    print('Not updated')
    set_output('updated', 'false')

contents = re.sub(r"^_pkgbuildnumber=.+$", f'_pkgbuildnumber={latest_build_number}', contents, flags=re.MULTILINE)
contents = re.sub(r"^_pkgversion=.+$", f'_pkgversion={latest_version}', contents, flags=re.MULTILINE)
contents = re.sub(r"(sha256sums_x86_64=\(\n  ').+'\n", f"\g<1>{latest_hash_x86_64}'\n", contents)

with open('PKGBUILD', 'w') as fp:
    fp.write(contents)
