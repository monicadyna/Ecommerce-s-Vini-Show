# Ecommerce's Vini Show
Este trabalho mostra como desenvolver um fluxo completo de preparação e transformação de dados de um conjunto de dados brutos de um ecommerce brasileiro.

---

## Divisão de tarefas
- **Criação do dockerfile do projeto**
    - Responsáveis - Vinishow e Renato Mori

- **Criação do banco transacional**
    - Responsável - Renato Mori

- **Criação do modelo do banco transacional**
    - Responsáveis - Mônica Dyna e Henrique Arduini
<!-- comentário para inserir imagem -->

- **Ingestão os dados para o modelo transacional**
    - Responsável - Vinishow
---
- **Criação do banco analítico**
    - Responsável - Renato Mori

- **Criação do modelo do banco analítico**
    - Responsáveis - Henrique Arduini e Mônica Dyna

- **Ingestão os dados para o modelo analítico**
    - Responsável - Vinishow
---
- **Documentação do projeto: README.md**
    - Responsáveis - Todos

- **Documentação do código e scripts**
    - Responsáveis - Todos


    ------------
    ------------
    ------------
    ------------
    # Case 2
### MBA Engenharia de Dados
### Universidade Presbiteriana Mackenzie
### Matéria: Data Collection & Storage


## Integrantes

|Nome               |
|----               |
|Gustavo Bido       |
|João Pedro         |
|Kayque Mendes      |
|Vinícius Soares    |


## Proposta 
1. Pense no nome do Domínio de informação e da Sigla
2. Pense no modelo de negócio e crie os campos com nomes lógicos e físicos
3. Crie o Glossário de Dados
4. Desenhe as tabelas físicas e lógicas Relacionais com as (Chave PK e campos)
5. Crie as tabelas Fato e Dimensão
6. Crie o Script SQL para criar a tabela FATO (Extract / Data Collection)

## Solução

### 1. Pense no nome do Domínio de informação e da Sigla
### Domínio de informação: Prestação de Serviços
### Sigla: SRVC

### 2. Modelo de negócio e campos com nomes lógicos

## Tabelas

### servico

|Lógico                 |   Físico          |   Chave   |
|-----------------------|---------------    |:---------:|
|Código do Serviço      |`id_servico`       |PK         |
|Código do Cliente      |`id_cliente`       |FK         |
|Código do Profissional |`id_profissional`  |FK         |
|Filial executada       |`id_filial`        |FK         |
|Descrição do Serviço   |`descricao`        |           |
|Data do Serviço        |`data`             |           |
|Valor do serviço       |`valor`            |           |

### cliente

|Lógico                 |   Físico      |   Chave   |
|-----------------------|---------------|:---------:|
|Código do Cliente      |`id_cliente`   |PK         |
|Nome do Cliente        |`nome`         |           |
|Endereço do Cliente    |`endereco`     |           |
|Telefone do Cliente    |`telefone`     |           |

### profissional

|Lógico                 |       Físico      |   Chave   |
|-----------------------|---------------    |:---------:|
|Código do Profissional |`id_profissional`  |PK         |
|Nome do Profissional   |`nome`             |           |
|Cargo do Profissional  |`cargo`            |           |

### filial

|Lógico                     |       Físico      |   Chave   |
|---------------------------|-------------------|:---------:|
|Código da Filial           |`id_filial`        |PK         |
|Código do Gerente da Filial|`id_gerente`       |FK         |
|Endereço da Filial         |`endereco`         |           |
|Telefone da Filial         |`telefone`         |           |

### gerente

|Lógico                 |       Físico      |   Chave   |
|-----------------------|-------------------|:---------:|
|Código do Gerente      |`id_gerente`       |PK         |
|Nome do Gerente        |`nome`             |           |
|Telefone do Gerente    |`cargo`            |           |
|Código da Filial       |`id_filial`        |FK         |


### 3. Crie o Glossário de Dados

|          Nome Físico          |              Nome Lógico            |     Tipo de Valor    |             Descrição               |
|              --               |                   --                |             --       |               ---                   |
|servico.id_servico             | Identificador de Serviços  (PK)     | Int()                | Identificador único do serviço      |
|servico.id_profissional        | Identificador de Profissional (FK)  | Int()                | Identificador único do profissional |
|servico.id_cliente             | Identificador do Cliente (FK)       | Int()                | Identificador único do cliente      |
|servico.id_filial              | Identificar de Filial (FK)          | Int()                | Identificador único da filial       |
|servico.descricao              | Descrição do Serviço                | Char()               | Descrição do serviço prestado       |
|servico.data                   | Data do Serviço                     | Data()               | Data do serviço prestado            |
|servico.valor                  | Valor do Serviço                    | float()              | Valor do serviço prestado           |
|cliente.id_cliente             | Identificador do Cliente (PK)       | Int()                | Identificador único do cliente      |
|cliente.nome                   | Nome do Cliente                     | Char()               | Nome do cliente                     |
|cliente.endereco               | Endereço do Cliente                 | Char()               | Endereço do cliente                 |
|cliente.telefone               | Telefone do Cliente                 | Int()                | Telefone do cliente                 |
|profissional.id_profissional   | Identificador de Profissional (PK)  | Int()                | Identificador único do profissional |
|profissional.nome              | Nome do Profissinal                 | Char()               | Nome do Profissional                |
|profissional.cargo             | Cargo do Profissional               | Char()               | Cargo do profissional               |
|filial.id_filial               | Identificador da Filial             | Int()                | Identificador único da filial       |
|filial.endereco                | Endereço da Filial                  | Char()               | Endereço da filial                  |
|filial.telefone                | Telefone da Filial                  | Char()               | Telefone da filial                  |
|filial.id_gerente              | Gerente da Filial (FK)              | Int()                | Identificador único do gerente      |
|gerente.id_gerente             | Identificar de Gerentes (PK)        | Int()                | Identificador único do gerente      |
|gerente.nome                   | Nome do Gerente                     | Char()               | Nome do gerente                     |
|gerente.telefone               | Telefone do Gerente                 | Int()                | Telefone do gerente                 |

### 4. Desenhe as tabelas físicas e lógicas Relacionais com as (Chave PK e campos)

### Tabelas Físicas 

### servico
|Campo              |Tipo           |PK |NULL   |
|-                  |-              |-  |-      |
|id_servico         |int            |S  |N      |
|id_profissional    |int            |N  |N      |
|id_cliente         |int            |N  |N      |
|id_filial          |int            |N  |N      |
|descricao          |varchar(200)   |N  |N      |
|data               |datetime       |N  |N      |
|valor              |float          |N  |N      |

### cliente

|Campo              |Tipo           |PK |NULL   |
|-                  |-              |-  |-      |
|id_cliente         |int            |S  |N      |
|nome               |varchar(50)    |N  |N      |
|endereco           |varchar(100)   |N  |N      |
|telefone           |int            |N  |N      |

### profissional

|Campo              |Tipo           |PK |NULL   |
|-                  |-              |-  |-      |
|id_profissional    |int            |S  |N      |
|nome               |varchar(50)    |N  |N      |
|cargo              |varchar(30)    |N  |N      |

### filial

|Campo              |Tipo           |PK |NULL   |
|-                  |-              |-  |-      |
|id_filial          |int            |S  |N      |
|id_gerente         |int            |N  |N      |
|telefone           |int            |N  |N      |
|endereco           |varchar(100)   |N  |N      |

### gerente

|Campo              |Tipo           |PK |NULL   |
|-                  |-              |-  |-      |
|id_gerente         |int            |S  |N      |
|nome               |varchar(50)    |N  |N      |
|telefone           |int            |N  |N      |
|id_filial          |int            |N  |N      |

### Tabelas Lógicas

![relational](src/diagrams/relational.png)

### 5. Crie as tabelas Fato e Dimensão

![dfDiagram](src/diagrams/dfDiagram.png)

### 6. Crie o Script SQL para criar a tabela FATO (Extract / Data Collection)

```sql
CREATE TABLE [fato_servico] (
  [id_servico] integer PRIMARY KEY,
  [id_cliente] integer,
  [id_profissional] integer,
  [id_filial] integer,
  [descricao] nvarchar(255),
  [data] date,
  [valor] float
)
GO

--Criação das dimensões
CREATE TABLE [dim_cliente] (
  [id_cliente] integer PRIMARY KEY,
  [nome] nvarchar(255)
)
GO

CREATE TABLE [dim_profissional] (
  [id_profissional] integer PRIMARY KEY,
  [nome] nvarchar(255)
)
GO

CREATE TABLE [dim_filial] (
  [id_filial] integer PRIMARY KEY,
  [id_gerente] integer
)
GO

CREATE TABLE [dim_gerente] (
  [id_gerente] integer PRIMARY KEY,
  [nome] nvarchar(255)
)
GO

-- Adição das foreign keys
ALTER TABLE [fato_servico] ADD FOREIGN KEY ([id_cliente]) REFERENCES [dim_cliente] ([id_cliente])
GO

ALTER TABLE [fato_servico] ADD FOREIGN KEY ([id_profissional]) REFERENCES [dim_profissional] ([id_profissional])
GO

ALTER TABLE [fato_servico] ADD FOREIGN KEY ([id_filial]) REFERENCES [dim_filial] ([id_filial])
GO

ALTER TABLE [dim_gerente] ADD FOREIGN KEY ([id_gerente]) REFERENCES [dim_filial] ([id_gerente])
GO
```