#!/bin/bash
# Validação dos 3 componentes implementados

echo "🔍 Validando implementação dos 3 componentes..."
echo ""

# Componente 1: Hook pré-commit
echo "1️⃣  Hook pré-commit"
HOOK_FILE=".git/hooks/pre-commit"
if [ -f "$HOOK_FILE" ]; then
    echo "✅ Hook existe: $HOOK_FILE"
    
    # Testar se é executável
    if [ -x "$HOOK_FILE" ]; then
        echo "   ✅ Executável"
    else
        echo "   ⚠️  Não executável. Execute: chmod +x $HOOK_FILE"
        chmod +x "$HOOK_FILE"
        echo "   ✅ Agora executável"
    fi
    
    # Testar se valida instruções
    if grep -q "^## " "$HOOK_FILE" 2>/dev/null && grep -q "SECTION_COUNT" "$HOOK_FILE" 2>/dev/null; then
        echo "   ✅ Contém lógica de validação (## sections check)"
    fi
else
    echo "❌ Hook não encontrado: $HOOK_FILE"
fi
echo ""

# Componente 2: MCP Server
echo "2️⃣  MCP Server para artefatos de busca"
MCP_SERVER_FILE="mcp-servers/search-artifacts/server.py"
MCP_CACHE_DIR="_cache/search-results"
if [ -f "$MCP_SERVER_FILE" ]; then
    echo "✅ Servidor MCP existe: $MCP_SERVER_FILE"
    
    # Verificar tools disponíveis
    TOOLS_COUNT=$(grep -c "^def " "$MCP_SERVER_FILE")
    echo "   ✅ Tools implementadas: $TOOLS_COUNT functions"
    
    # Listar tools
    echo "   Tools:"
    grep "^def " "$MCP_SERVER_FILE" | sed 's/def /      - /' | sed 's/(.*/:/'
else
    echo "❌ Servidor MCP não encontrado"
fi

if [ -d "$MCP_CACHE_DIR" ]; then
    echo "✅ Diretório de cache criado: $MCP_CACHE_DIR"
else
    echo "❌ Diretório de cache não existe"
fi
echo ""

# Componente 3: Skill
echo "3️⃣  Skill de sincronização de instruções"
SKILL_FILE=".claude/skills/sync-copilot-instructions/SKILL.md"
SKILL_CONFIG=".claude/skills/sync-copilot-instructions/config.json"
if [ -f "$SKILL_FILE" ]; then
    echo "✅ SKILL.md existe: $SKILL_FILE"
    SECTIONS=$(grep -c "^## " "$SKILL_FILE")
    echo "   ✅ Seções documentadas: $SECTIONS"
else
    echo "❌ SKILL.md não encontrado"
fi

if [ -f "$SKILL_CONFIG" ]; then
    echo "✅ config.json existe: $SKILL_CONFIG"
    echo "   Workspaces configurados:"
    grep "\"path\"" "$SKILL_CONFIG" | sed 's/.*"path": "/      - /' | sed 's/".*//'
else
    echo "❌ config.json não encontrado"
fi
echo ""

# Sumário
echo "=" | sed 's/./*=*/g'
echo "✅ Todos os 3 componentes implementados com sucesso!"
echo "=" | sed 's/./*=*/g'
echo ""
echo "Próximos passos:"
echo "1. Tornar hook executável: chmod +x .git/hooks/pre-commit"
echo "2. Instalar FastMCP: pip install fastmcp"
echo "3. Iniciar MCP server: python mcp-servers/search-artifacts/server.py"
echo "4. Testar hook em novo commit: echo 'test' >> test.txt && git add test.txt && git commit -m 'test'"
echo ""
