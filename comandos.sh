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
rails server -d

# Criar um controller com 4 páginas estáticas
rails g controller Paginas home recurso preco contato

# criar uma rota root em config/routes.rb: root 'paginas#home'
git add .
git commit -m "rails g controller Paginas home recurso preco contato"
 
# baixar o css do bootstrap em public/bootstrap.min.css
wget -O public/bootstrap.min.css http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css

# Linkar em app/views/layouts/application.html.erb: <link rel="stylesheet" href="/bootstrap.min.css">

# Colocar o layout do site dentro de um container no mesmo arquivo acima:
<div class="container">
   <%= yield %>
</div>

git add .
git commit -m "add bootstrap.min.css"
