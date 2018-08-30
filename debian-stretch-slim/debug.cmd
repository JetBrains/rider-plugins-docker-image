for /F %%A in ('docker ps -a ^| find "rider-frontend"') do (docker stop %%A && docker rm %%A)
docker build -t rider-frontend -m 4GB .
docker run -dit --name rider-frontend --memory 4GB rider-frontend
docker attach rider-frontend