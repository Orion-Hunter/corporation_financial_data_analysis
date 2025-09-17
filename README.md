# 📊 Projeto de Modelagem de Dados com dbt

## 📌 Visão Geral

**Objetivo:** construir camadas **Bronze → Silver → Gold** para disponibilizar um **modelo estrela** pronto para análises financeiras.

* **Fonte:** arquivos CSV (seeds na camada Bronze).
* **Output:** tabelas Gold modeladas em **star schema** e dashboards com indicadores financeiros como:

  * 📈 Dias Médios de Recebimento (DMR)
  * 📊 Aging
  * 💸 Taxa de Inadimplência
  * 👥 Índice de Concentração de Clientes

---

## 🏗️ Arquitetura

**Arquitetura Medallion (Bronze / Silver / Gold):**

* 🟤 **Bronze** → ingestão de arquivos CSV brutos (seeds). Mantém cópia fiel dos dados de origem.
* ⚪ **Silver** → limpeza, cast de tipos, normalizações e deduplicações.
* 🟡 **Gold** → modelos prontos para consumo analítico (**star schema** — fatos e dimensões).

**Ferramentas envolvidas:**

* 🟦 **dbt** — modelagem e ingestão
* 🐘 **Postgres** — Data Lake / Data Warehouse (DataLakehouse)
* 🐳 **Docker** — para criar instância do Postgres
* 📊 **Power BI** — camada de visualização e análise

---

## 📂 Estrutura do Projeto (exemplo)

```
.
├── models/
│   ├── gold/
│   ├── silver/
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
```

---

## ⚙️ Requisitos (locais)

* 🐳 Docker & Docker Compose
* 🟦 `dbt-core` + adapter (ex.: `dbt-postgres`) 
* 🐍 Python 3.8+ (se usar scripts auxiliares) e Poetry
* 🌱 Git

---
## 📌 Instruções para criar uma instância postgres com Docker

Executar o comando:

```bash 
docker compose up -d
```

---

## 📌 Criar ambiente virtual com poetry e instalar dependências

Com o poetry instalado na máquina, executar o comando:

```bash 
poetry install
```

Para executar os demais comandos, ativar o ambiente virtual criado:

```bash
poetry shell
```
---

## 🧩 Seeds (Bronze)

Exemplo de comando para carregar seeds:

```bash
dbt seed --select titulos
```

---

## 🧩 Layers (Silver and Gold)

Exemplo de comando para carregar os models nas camadas Silver e Gold:

```bash 
dbt run 
```
---


## 📊 Documentação (dbt docs)

Gerar e servir a documentação:

```bash
dbt docs generate
dbt docs serve
```

---