
## Note

You need to Read the license and accept the terms first. Then you can use the patch to install without prompt.

## How to use :

download the stm32cubeclt linux installer from the [ST website](https://www.st.com/en/development-tools/stm32cubeclt.html) and put it in this folder. **only one file with en.st-stm32cubeclt*amd64.sh.zip needs to be present, otherwise you will have unexpected results**.

Build the docker container
```
docker build -t rotule666/st-stm32cubeclt .
```

run the container
```
docker run -it rotule666/st-stm32cubeclt bash
```

run the container with a project
```
./run.sh $YOURPATH
```
The project is in /opt/project

### build a stm32cube project

for example, your project is in `~/stm32cube-vs-project`

```
./run.sh ~/stm32cube-vs-project

cd /opt/project
source vcpkg-init
vcpkg activate

# I have a preset named SKSB, modify this for your project
cmake -DCMAKE_BUILD_TYPE=Debug -DPRESET_NAME=SKSB -DSK_SBMS=ON -DCMAKE_INSTALL_PREFIX=/opt/project/build/SKSB/install -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/opt/project/cmake/gcc-arm-none-eabi.cmake -S/opt/project -B/opt/project/build/SKSB/build -G Ninja

cmake --build /opt/project/build/SKSB/build

```