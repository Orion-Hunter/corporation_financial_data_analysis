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
* 🐳 **Docker** — ambiente local reproducível
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
* 🟦 `dbt-core` + adapter (ex.: `dbt-postgres`) se rodar local sem container
* 🐍 Python 3.8+ (se usar scripts auxiliares)
* 🌱 Git

---

## 🧩 Seeds (Bronze)

Exemplo de comando para carregar seeds:

```bash
dbt seed --select titulos
```

---

## 📊 Documentação (dbt docs)

* Documente modelos e colunas em `schema.yml` com `description`.

Gerar e servir a documentação:

```bash
dbt docs generate
dbt docs serve
```

---