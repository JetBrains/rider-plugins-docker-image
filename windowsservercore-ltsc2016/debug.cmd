for /F %%A in ('docker ps -a ^| find "rider-windows"') do docker rm %%A
docker build -t rider-windows -m 2Gb .
docker run -dit --name rider-windows -m 2Gb rider-windows
docker attach rider-windows