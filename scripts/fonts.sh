#!/usr/bin/env bash

FONTS_DIR=${HOME}/.fonts

URLS=(
https://github.com/belluzj/fantasque-sans/releases/download/v1.7.2/FantasqueSansMono-Normal.zip
)

[[ ! -d ${FONTS_DIR} ]] && mkdir -v ${FONTS_DIR}

cd ${FONTS_DIR}

for URL in ${URLS[@]}; do
    FPKG="$(basename ${URL})"
    curl -fsSLO ${URL}
    echo "Finished downloading ${FPKG}"
    if [[ "${FKG##*.}" == "zip" ]]; then
      unzip -u ${FPKG}
    fi
done

# clone some fonts away
git clone https://go.googlesource.com/image
cp -avxr image/font/gofont/ttfs/* .

# cleanup
rm -rfv *.zip image

[[ "$(uname)" != "Darwin" ]] && fc-cache -f -v
