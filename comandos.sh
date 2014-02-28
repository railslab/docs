# criar nova aplicação rails chamada help_desk
# o parâmetro -B desliga a execução automática do bundle
rails new help_desk -B

# entrar dentro da pasta do projeto
cd help_desk

# inicializar um projeto git
git init
# adicionar todos os arquivos ao git
git add .
# primeiro comit com a mensagem sendo o comando utilizado 
git commit -m "rails new help_desk -B"

# agora instalar as dependências globalmente.
# Será gerado o arquivo Gemfile.lock, que trava as versões das bibliotecas.
bundle install --verbose
# comitar novo arquivo
git add Gemfile.lock
git commit -m "bundle install --verbose # Gemfile.lock"

# rodar o servidor em background, navegar para http://localhost:3000/
rails server -d # kill -9 $(lsof -i :3000 -t) para matar o servidor

# Criar um controller com 4 páginas estáticas
rails g controller Paginas home recurso preco contato

# criar uma rota root em config/routes.rb: root 'paginas#home'
git add .
git commit -m "rails g controller Paginas home recurso preco contato"
 
# baixar o css do bootstrap em public/bootstrap.min.css
wget -O public/bootstrap.min.css http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css

# Linkar em app/views/layouts/application.html.erb logo abaixo do título:
# <link rel="stylesheet" href="/bootstrap.min.css">

# Colocar o layout do site dentro de um container no mesmo arquivo acima:
<div class="container">
   <%= yield %>
</div>

git add .
git commit -m "add bootstrap.min.css"

# No layout, adicionar navegação no topo da página:
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">Help Desk</a>
    </div>

    <ul class="nav navbar-nav">
      <li><a href="/">Home</a></li>
      <li><a href="/recursos">Recursos</a></li>
      <li><a href="/precos">Preços</a></li>
      <li><a href="/contato">Fale Conosco</a></li>
    </ul>
  </div>
</nav>

# comitar
git add app/views/layouts/application.html.erb
git commit -m "adiciona navegação no topo da página"

# refatorar a navegação para deixar mais legível e substituir os hrefs manuais por funções de rota

# Mover o html do menu, para seu próprio arquivo em: layouts/_menu.html.erb
# Incluir utilizando: <%= render 'layouts/menu' %>

git add .
git commit -m "rails way para separar partes das views"

# salvar os contatos no banco de dados
rails g model -f Contato nome email mensagem:text
# criar a tabela no banco de dados
rake db:migrate
git add .
git commit -m "cria model Contato no banco de dados"

# gerar controller específico para contatos
rails g controller contatos index new enviado

# adicionar campo lido para a tabela de contatos
rails g migration AddLidoToContato lido:boolean
