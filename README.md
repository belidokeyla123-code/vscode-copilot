# Copilot CLI - Auto-Configuration

Configuração persistente para Copilot CLI em VS Code. Sincroniza automaticamente entre local, GitHub e Dropbox.

## Features

- Auto-load: Carrega copilot-instructions.md em cada nova sessão
- GitHub Sync: Sincroniza via git push automático
- Token Seguro: Armazenado em .env (não commitado)
- Triple Backup: Local + GitHub + Dropbox
- Consolidado: CLAUDE + AGENTS + OPENCODE + WORKFLOW em um arquivo

## Estrutura

```
.copilot/
├── .env                          # Token GitHub (não commitar!)
├── copilot-instructions.md       # Instruções consolidadas (auto-carregado)
├── .gitignore                    # Exclui .env
└── README.md                     # Este arquivo
```

## Quick Start

### 1. Clone
```bash
git clone https://github.com/belidokeyla123-code/vscode-copilot.git
```

### 2. Configure Token
```bash
# Criar .env na pasta .copilot
echo 'GITHUB_TOKEN=seu_token_aqui' > ~/.copilot/.env
```

### 3. Pronto!
Abra o Copilot CLI — ele carrega automaticamente!

## Segurança

- .env é ignorado pelo Git (veja .gitignore)
- Token nunca é commitado
- Regenerável em GitHub Settings
- Acesso apenas local

## Como Atualizar

1. Edite ~/.copilot/copilot-instructions.md
2. Teste localmente no Copilot CLI
3. Commit e push:
   ```bash
   git add copilot-instructions.md
   git commit -m "feat: Updated instructions"
   git push
   ```

## Sincronização (Triple Backup)

### Local
C:\Users\Belido1\.copilot\

### GitHub
https://github.com/belidokeyla123-code/vscode-copilot

### Dropbox (Cerebro)
C:\Users\Belido1\Dropbox\Public\IA\JAMES\Obsidian\Cerebro-Vault\OpenCode-Setup\Copilot-CLI-Setup\

## Links

- Repository: https://github.com/belidokeyla123-code/vscode-copilot
- Setup Guide: Cerebro-Vault/OpenCode-Setup/Copilot-CLI-Setup/01-SETUP-GUIDE.md
- Instructions: .copilot/copilot-instructions.md

## Configurações Consolidadas

Este arquivo contém consolidação de:
- CLAUDE.md — Protocolo Claude (PT-BR)
- AGENTS.md — Hierarchy e disponibilidade de agentes
- OPENCODE.md — Processos OpenCode
- WORKFLOW.md — Workflow padrão

---

Status: Operational
Last Updated: 2026-06-26
Sync: Automático via Git push
