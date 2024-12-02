### MBA Engenharia de Dados
### Universidade Presbiteriana Mackenzie
### Matéria: Data Prep & Transformation

# Ecommerce's Vini Show
Este trabalho mostra como desenvolver um fluxo completo de preparação e transformação de dados de um conjunto de dados brutos de um ecommerce brasileiro. O código e os arquivos gerados encontram-se disponíveis neste repositório para consulta e replicação.

---

## Integrantes

|Nome               |
|----               |
|Henrique Arduini   |
|Mônica Dyna        |
|Renato Mori        |
|Vinícius Soares    |

## Desafio
1. Criar relacionamento das tabelas do diagrama abaixo. De forma que não perca a linhas da tabela Produto.
   <!-- comentário para inserir imagem -->
2. Filtrar os dados somente com dados que o campo MakeFlag é igual 0 da tabela produto.
3. Gerar um arquivo agregado por categoria e quantidade de produtos diferentes. Formato dos arquivos Excel.
4. Gerar um arquivo com todas as informações das 3 tabelas. Filtrar campos (colunas) que sejam repetidos (chaves estrangeiras). Formato do arquivo CSV.)

## Divisão de tarefas
- **Criação do dockerfile do projeto**
    - Responsáveis - Vinicíus Soares e Renato Mori

- **Criação do banco transacional**
    - Responsável - Renato Mori

- **Criação do modelo do banco transacional**
    - Responsáveis - Mônica Dyna e Henrique Arduini
<!-- comentário para inserir imagem -->

- **Ingestão os dados para o modelo transacional**
    - Responsável - Vinicíus Soares
---
- **Criação do banco analítico**
    - Responsável - Renato Mori

- **Criação do modelo do banco analítico**
    - Responsáveis - Henrique Arduini e Mônica Dyna

- **Ingestão os dados para o modelo analítico**
    - Responsável - Vinicíus Soares
---
- **Documentação do projeto: README.md**
    - Responsáveis - Todos

- **Documentação do código e scripts**
    - Responsáveis - Todos

    
## Solução

### 1. Criar relacionamento das tabelas do diagrama proposto, de forma que não perca a linhas da tabela Produto.
## Tabelas
<!-- comentário para inserir imagem -->

### Costumers

|Lógico                 |   Físico          |   Chave   |
|-----------------------|---------------    |:---------:|
|Código do Serviço      |`id_servico`       |PK         |
|Código do Cliente      |`id_cliente`       |FK         |
|Código do Profissional |`id_profissional`  |FK         |
|Filial executada       |`id_filial`        |FK         |
|Descrição do Serviço   |`descricao`        |           |
|Data do Serviço        |`data`             |           |
|Valor do serviço       |`valor`            |           |

### Geolocation

|Lógico                 |   Físico      |   Chave   |
|-----------------------|---------------|:---------:|
|Código do Cliente      |`id_cliente`   |PK         |
|Nome do Cliente        |`nome`         |           |
|Endereço do Cliente    |`endereco`     |           |
|Telefone do Cliente    |`telefone`     |           |

### Order Items

|Lógico                 |       Físico      |   Chave   |
|-----------------------|---------------    |:---------:|
|Código do Profissional |`id_profissional`  |PK         |
|Nome do Profissional   |`nome`             |           |
|Cargo do Profissional  |`cargo`            |           |

### Order Payments

|Lógico                     |       Físico      |   Chave   |
|---------------------------|-------------------|:---------:|
|Código da Filial           |`id_filial`        |PK         |
|Código do Gerente da Filial|`id_gerente`       |FK         |
|Endereço da Filial         |`endereco`         |           |
|Telefone da Filial         |`telefone`         |           |

### Order Reviews 

|Lógico                 |       Físico      |   Chave   |
|-----------------------|-------------------|:---------:|
|Código do Gerente      |`id_gerente`       |PK         |
|Nome do Gerente        |`nome`             |           |
|Telefone do Gerente    |`cargo`            |           |
|Código da Filial       |`id_filial`        |FK         |

### Orders 

|Lógico                 |       Físico      |   Chave   |
|-----------------------|-------------------|:---------:|
|Código do Gerente      |`id_gerente`       |PK         |
|Nome do Gerente        |`nome`             |           |
|Telefone do Gerente    |`cargo`            |           |
|Código da Filial       |`id_filial`        |FK         |

### Products

|Lógico                 |       Físico      |   Chave   |
|-----------------------|-------------------|:---------:|
|Código do Gerente      |`id_gerente`       |PK         |
|Nome do Gerente        |`nome`             |           |
|Telefone do Gerente    |`cargo`            |           |
|Código da Filial       |`id_filial`        |FK         |

### Sellers

|Lógico                 |       Físico      |   Chave   |
|-----------------------|-------------------|:---------:|
|Código do Gerente      |`id_gerente`       |PK         |
|Nome do Gerente        |`nome`             |           |
|Telefone do Gerente    |`cargo`            |           |
|Código da Filial       |`id_filial`        |FK         |

### Product Category Name

|Lógico                 |       Físico      |   Chave   |
|-----------------------|-------------------|:---------:|
|Código do Gerente      |`id_gerente`       |PK         |
|Nome do Gerente        |`nome`             |           |
|Telefone do Gerente    |`cargo`            |           |
|Código da Filial       |`id_filial`        |FK         |


### 2. Filtrar os dados somente com dados que o campo MakeFlag é igual 0 da tabela produto.
<!-- comentário para inserir imagem -->

### 3. Gerar um arquivo agregado por categoria e quantidade de produtos diferentes. Formato dos arquivos Excel.
<!-- comentário para inserir imagem -->

### 4. Gerar um arquivo com todas as informações das 3 tabelas. Filtrar campos (colunas) que sejam repetidos (chaves estrangeiras). Formato do arquivo CSV.)
<!-- comentário para inserir imagem -->

## Conclusão
Este trabalho apresentou o desenvolvimento de um fluxo completo de preparação e transformação de dados a partir de um conjunto de dados brutos de um e-commerce brasileiro. Durante o processo, foram aplicadas técnicas de manipulação e análise de dados, com foco nos seguintes pontos:

Relacionamento de tabelas: Criamos o relacionamento entre as tabelas do diagrama fornecido, preservando todas as linhas da tabela Produto, garantindo que nenhum dado relevante fosse perdido no processo.
Filtragem de dados: Aplicamos um filtro na tabela Produto para selecionar apenas as linhas em que o campo MakeFlag possui valor igual a 0, restringindo a análise a produtos específicos conforme solicitado.
Geração de arquivos agregados: Foi gerado um arquivo Excel contendo informações agregadas por categoria e quantidade de produtos distintos, facilitando a análise de padrões e tendências por categoria.
Consolidação de informações: Criamos um arquivo CSV unificado com todas as informações das três tabelas, eliminando colunas repetidas ou redundantes (chaves estrangeiras) para simplificar a visualização e análise dos dados.

## Aprendizados e Impactos
Este desafio possibilitou a prática de habilidades essenciais em engenharia de dados, como criação de relacionamentos, filtragem criteriosa, transformação de dados e exportação para formatos práticos e acessíveis. O resultado final permitiu obter informações relevantes para a análise estratégica do e-commerce, promovendo insights acionáveis para tomadas de decisão.

Com este trabalho, foi demonstrada a importância de um pipeline de dados bem estruturado, que conecta dados brutos a resultados concretos e utilizáveis. Além disso, o uso das ferramentas certas e boas práticas contribuiu para a consistência e qualidade dos dados transformados.
