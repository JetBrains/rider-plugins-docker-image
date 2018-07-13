for /F %%A in ('docker ps -a -q ^| find "rider-windows"') do docker rm %%A
docker build -t rider-windows .
docker run -dit --name rider-windows rider-windows
docker attach rider-windows