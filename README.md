Projeto com Flutter.

## Processo de desenvolvimento

Primeiro passo: fazer o projeto de alta fidelidade no Figma(Design).
- [Figma](https://www.figma.com/file/Kdbd0tFo3X9CtPvCI9Bvqz/e-commerce?node-id=1%3A2&t=1AgrX43kOFimuYDk-1)

*Obs.: Fontes, Cores, etc. foram copiadas do site IN8 do qual estou fazendo um teste para vaga de Desenvolverdor Flutter Junior.

Segundo passo: codificar no Flutter as telas(Header, Banner, Produtos, Detalhes, Carrinho). 

Terceiro passo: fazer a integração com a API.

*Obs.: Como todo Desenvolvedor Junior procurei ajuda em(videos, StackOverflow), e também de um profissional incrível(André Rossi).

## Passos para Instalação do Frontend

1-Crie uma nova pasta na Área de Trabalho com nome: FrontEnd.

2-Inicie o Visual Studio Code, abra uma Nova Janela(Ctrl + Shift + N). No Menu superior esquerdo encontre "Controle de Código-Fonte"(Ctrl + Shift + G).

3-Clique em "Clone Repository", copie e cole este link na barra superior( https://github.com/Bozelo/Frontend_Ecommerce.git ). Enter.

4-Abra um novo Terminal(Ctrl + Shift + '). Digite ( flutter pub get ). Enter.

5-Selecione 'Chome web', para isso use o atalho(Ctrl + Shift + P) e clique em "Flutter Select Devive" e escolha "Chome web" como Device.
No canto inferior direito você deve ver "Chrome(web-javascript)" como Device selecionado.

6-Procute a Pasta "lib" e clique nela. Clique no arquivo 'main'.Aperte F5 e espere a aplicação web aparecer.


## Passos para Instalação do BackEnd
- [Repositório Backend](https://github.com/Bozelo/Backend_Ecommerce)

1-Crie uma nova pasta na Área de Trabalho com nome: BackEnd.

2-Inicie o Visual Studio Code, abra uma Nova Janela(Ctrl + Shift + N). No Menu superior esquerdo encontre "Controle de Código-Fonte"(Ctrl + Shift + G).

3-Clique em "Clone Repository", copie e cole este link na barra superior( https://github.com/Bozelo/Backend_Ecommerce.git ). Enter.

4-Abra um novo Terminal(Ctrl + Shift + '). Digite ( npm install mongoose --save ). Enter.

5-Digite ( npm start ) para iniciar, você vai ver no terminal a mensagem "Server On". Quando desejar finalizar use( Ctrl + C ) e digite ( s ).

Agora você esta pronto para navegar no site e simular o que seria a compra de um produto. Ao adicionar o produto no carrinho e finalizar a compra você voltará para página Home(por enquanto o projeto esta sem a página de pagamentos). Mas você poderá observar no terminal Frontend a mensagem {"status_code":200,"message":"Compra realizada com sucesso!"}.

No Backend você verá a mensagem [ { id: '4', name: 'Intelligent Plastic Soap' } ], o que indica que sua compra foi salva com sucesso(produto não é salvo em um banco de dados por enquanto, salvo apenas em memória!).

Para dar um get no produto você pode utilizar o Postman. 
- [Postman](https://www.postman.com/downloads/)

Após download e instalação: 

1-Clique em 'Workspaces', depois em 'Create Workspace', de um nome exe.: getTeste. Clique em Create 'Workspace'.

2-Clique no botão '+'. Copie e cole o endereço( http://localhost:3000/api/product ) na barra "Enter request URL" ao lado de 'GET', clique em 'Send'.

Neste momento, se você finalizou uma compra no FrontEnd com o Backend On, você vai ver no Bory o "id" e o "nome" do produto. 

Exe.: "id": "4",  "name": "Intelligent Plastic Soap"

Caso algum dos passos não ocorram como o planejado, fique a vontade para entrar em contado.
- [Linkedin](https://www.linkedin.com/in/jean-bozelo-b90521243/)

