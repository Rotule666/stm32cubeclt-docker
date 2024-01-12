#!/bin/bash
diff -u setupOriginal.sh setup.sh > setup.patch

sed -i '1s/setupOriginal.sh/setup.sh/' setup.patch