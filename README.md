📊 Projeto de Modelagem de Dados com dbt
📌 Visão Geral

Breve descrição do projeto:

Objetivo: construir camadas Bronze → Silver → Gold para disponibilizar um modelo estrela pronto para análises financeiras.

Fonte: arquivos CSV como fonte original (seeds na camada Bronze).

Output: tabelas Gold modeladas em star schema e dashboards com indicadores financeiros (DMR — Dias Médios de Recebimento, Aging, Taxa de Inadimplência, Índice de Concentração de Clientes, etc.).

🏗️ Arquitetura

Arquitetura em Medallion (Bronze / Silver / Gold):

Bronze: ingestão de arquivos CSV brutos (seeds). Mantém cópia fiel dos dados de origem.

Silver: limpeza, cast de tipos, normalizações e deduplicações.

Gold: modelos prontos para consumo analítico (star schema — fatos e dimensões).

Ferramentas:

dbt — modelagem e ingestão.

Postgres — Data Lake / Data Warehouse (DataLakehouse).

Docker — ambiente local reproducível.

Power BI — consumirão a camada Gold.

📂 Estrutura do Projeto (exemplo)
.
├── models/
│   ├── gold/
│   │   ├── marts/
│   │   └── dim_*.sql
│   ├── silver/
│   │   └── staging_*.sql
├── seeds/
│   └── bronze/
│       ├── clientes.csv
│       ├── lojas.csv
│       ├── departamentos.csv
│       └── titulos.csv
├── macros/
├── dbt_project.yml
├── packages.yml
└── README.md

⚙️ Requisitos (locais)

Docker & Docker Compose

dbt-core + adapter (ex.: dbt-postgres) se for rodar local sem container

Python 3.8+ (se usar scripts auxiliares)

Git

🧩 Seeds (Bronze)

Coloque os CSVs em seeds/bronze/.

Configure tipos no schema.yml para seeds (ex.: column_types) para garantir cast correto na carga.

Exemplo de comando para carregar seeds:

dbt seed --select titulos

📊 Documentação (dbt docs)

Documente modelos e colunas em schema.yml com description.

Gerar e servir:

dbt docs generate
dbt docs serve
