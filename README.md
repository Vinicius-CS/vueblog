<div align="center">
  <img src="https://i.imgur.com/qsT0jUk.png" height="100" alt="Vue Blog Logo"/>
</div>

<hr>

<div align="center">
  <img alt="Vinicius-Vue" src="https://img.shields.io/badge/Vue.js-323330?style=for-the-badge&logo=vue.js&logoColor=FFF">
  <img alt="Vinicius-Vuetify" src="https://img.shields.io/badge/Vuetify-323330?style=for-the-badge&logo=vuetify&logoColor=FFF">
  <img alt="Vinicius-HTML" src="https://img.shields.io/badge/HTML-323330?style=for-the-badge&logo=html5&logoColor=FFF">
  <img alt="Vinicius-CSS" src="https://img.shields.io/badge/CSS-323330?&style=for-the-badge&logo=css3&logoColor=FFF">
  <img alt="Vinicius-Js" src="https://img.shields.io/badge/JavaScript-323330?style=for-the-badge&logo=javascript&logoColor=FFF">
  <img alt="Vinicius-Python" src="https://img.shields.io/badge/Python-323330?style=for-the-badge&logo=python&logoColor=FFF">
  <img alt="Vinicius-Django" src="https://img.shields.io/badge/Django-323330?style=for-the-badge&logo=django&logoColor=FFF">
  <img alt="Vinicius-MySQL" src="https://img.shields.io/badge/MySQL-323330?style=for-the-badge&logo=mysql&logoColor=FFF">
</div>

Projeto de blog com frontend em Vue 3 e Vuetify 3 para estilização e backend em Python 3 e Django.
Para o banco de dados, foi utilizado o MySQL, o diagrama e a SQL com as tabelas populadas se encontram na pasta [documentos](https://github.com/Vinicius-CS/vueblog/tree/main/documentos), bem como as considerações do projeto.

<hr>

# Configurações

## Backend
Execute os comandos abaixo na pasta [backend](https://github.com/Vinicius-CS/vueblog/tree/main/backend).

Instale as bibliotecas do Python utilizadas no projeto:
- `pip install djangorestframework`
- `pip install django-cors-headers`
- `pip install pymysql`
- `pip install hashlib`

Configure as variáveis do banco de dados no arquivo [settings.py:90](https://github.com/Vinicius-CS/vueblog/blob/main/backend/djangoblog/settings.py#L90).

Crie um banco de dados chamado `vueblog`, se você utilizar outro nome para a database altere em [settings.py:93](https://github.com/Vinicius-CS/vueblog/blob/main/backend/djangoblog/settings.py#L93).
- ``CREATE DATABASE IF NOT EXISTS `vueblog`;``

Execute as migrations para criar as tabelas no banco de dados:
- `python manage.py makemigrations blog`

Passe para o próximo passo se você já importou a SQL.
- `python manage.py migrate blog`

## Frontend
Execute os comandos abaixo na pasta [frontend](https://github.com/Vinicius-CS/vueblog/tree/main/frontend):

Execute o comando abaixo para instalar as dependências do projeto:
- `npm install`

<br>

# Iniciando o Servidor

## Frontend
Execute o comando abaixo para iniciar o servidor de frontend:
- `npm run serve`

## Backend
Execute o comando abaixo para iniciar o servidor de backend:
- `python manage.py runserver localhost:8000`

<br>

# Configurações Opcionais
Você pode configurar a quantidade de artigos exibidos por página e a URL base da API em [config.json](https://github.com/Vinicius-CS/vueblog/blob/main/frontend/src/assets/config.json), certifique-se de manter o `/api`.
