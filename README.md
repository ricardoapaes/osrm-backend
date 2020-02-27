# likesistemas/osrm-backend

* Essa imagem apenas facilita a utilização do container Docker: osrm/osrm-backend

Imagem docker criada para criar um servidor rotas com os dados do Open Street Maps de uma determinada url informada como argumento.

Obs.: Por padrão está configurada para sul do Brasil.

Para usar usar a imagem passando o seguinte comando:

docker run -d -p 5000:5000 likesistemas/osrm-backend

Para fazer um novo build usar o seguinte comando:

docker build -t likesistemas/osrm-backend:latest .