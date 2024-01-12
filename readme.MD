
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


