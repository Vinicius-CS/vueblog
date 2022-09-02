<p align="center">
  <img src="https://i.imgur.com/5JJRkfW.png" alt="Vue Blog Logo"/>
</p>

Projeto de blog com frontend em Vue 3 e Vuetify para estilização e backend em Python e Django.

<hr>

## Backend
Execute os comandos abaixo na pasta [backend](https://github.com/Vinicius-CS/vueblog/tree/main/backend).

Instale as bibliotecas do Python utilizadas no projeto:
- `pip install djangorestframework`
- `pip install pymysql`
- `pip install django-cors-headers`

Execute as migrations para criar a estrutura do banco de dados:
- `python manage.py makemigrations blog`
- `python manage.py migrate blog`

Execute o comando abaixo para iniciar o servidor de backend:
- `python manage.py runserver localhost:8000`

## Frontend
Execute os comandos abaixo na pasta [frontend](https://github.com/Vinicius-CS/vueblog/tree/main/frontend):

Execute o comando abaixo para instalar as dependências do projeto:
- `npm install`

Execute o comando abaixo para iniciar o servidor de frontend:
- `npm run serve`
