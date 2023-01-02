#!/usr/bin/env bash
set -euxo pipefail

tag=$(echo "$GITHUB_REF" | cut -d '/' -f 3)
_tag=$(echo "$tag" | cut -d 'v' -f 2)
major="$(echo "$_tag" | cut -d '.' -f 1)"
minor="$(echo "$_tag" | cut -d '.' -f 2)"

git tag -d "v$major.$minor" 2> /dev/null
git tag "v$major.$minor" "$GITHUB_SHA"

git tag -d "v$major" 2> /dev/null
git tag "v$major" "$GITHUB_SHA"
